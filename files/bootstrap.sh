#!/usr/bin/env bash
#
# This bootstraps role_aio on Ubuntu 14.04 LTS and deploy this module
# Usage:
# wget https://github.com/pgomersbach/role_aio/raw/master/files/bootsrap.sh
# bash bootstrap.sh
#
set -e

# Load up the release information
. /etc/lsb-release

REPO_DEB_URL="http://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb"

#--------------------------------------------------------------------
# NO TUNABLES BELOW THIS POINT
#--------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Do the initial apt-get update
echo "Initial apt-get update..."
apt-get update >/dev/null

# Install git bundler
echo "Installing git, bundler..."
apt-get -y install -y git bundler zlib1g-dev >/dev/null

# Install the PuppetLabs repo
echo "Configuring PuppetLabs repo..."
repo_deb_path=$(mktemp)
wget --output-document="${repo_deb_path}" "${REPO_DEB_URL}" 2>/dev/null
dpkg -i "${repo_deb_path}" >/dev/null
apt-get update >/dev/null

# Install Puppet
echo "Installing Puppet..."
apt-get -y  install puppetserver >/dev/null
echo "Puppet installed!"
echo "Cloning repo"
git clone https://github.com/pgomersbach/test-role_aio.git /root/role_aio
cd role_aio
echo "Installing gems"
bundle install --path vendor/bundle
echo "Preparing modules"
bundle exec rake spec_prep
cp -a /root/role_aio/spec/fixtures/modules/* /etc/puppetlabs/code/modules/
echo "Run puppet"
/opt/puppetlabs/bin/puppet apply -e "include role_aio"
