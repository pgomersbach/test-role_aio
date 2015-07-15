require 'spec_helper'

describe 'role_aio' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo"
          })
        end

        context "role_aio class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
       
          it { is_expected.to contain_class('profile_base') }
          it { is_expected.to contain_class('profile_base::rspec_monitor') }

        end
      end
    end
  end
end
