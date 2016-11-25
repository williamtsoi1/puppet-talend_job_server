require 'spec_helper'

describe 'talend_job_server' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        case facts[:osfamily]
        when 'Debian'
          let(:facts) do
            {
              osfamily: 'Debian',
              operatingsystem: 'Debian',
              operatingsystemmajrelease: 7,
              staging_http_get: 'curl',
              path: '/usr/local/bin:/usr/bin:/bin'
            }
          end
        when 'RedHat'
          let(:facts) do
            {
              osfamily: 'RedHat',
              operatingsystem: 'RedHat',
              operatingsystemmajrelease: 6,
              staging_http_get: 'curl',
              path: '/usr/local/bin:/usr/bin:/bin'
            }
          end
        end
        context 'talend_job_server class with no job server url' do
          it { is_expected.to raise_error(Puppet::Error, //) }
        end
        context 'talend_job_server with minimum variables' do
          let(:params) do
            {
              talend_job_server_url: 'https://foobar.com/talend_job_server.zip'
            }
          end
          context 'install -> config ~> service pattern' do
            it { is_expected.to compile.with_all_deps }
            it { is_expected.to contain_class('talend_job_server::params') }
            it { is_expected.to contain_class('talend_job_server::install').that_comes_before('Class[talend_job_server::config]') }
            it { is_expected.to contain_class('talend_job_server::config') }
            it { is_expected.to contain_class('talend_job_server::service').that_subscribes_to('Class[talend_job_server::config]') }
          end
          context 'job server installed' do
            it { is_expected.to contain_Mkdir__p('/opt/talend_job_server') }
            it { is_expected.to contain_file('/opt/talend_job_server') }
            it { is_expected.to contain_Staging__deploy('Talend-JobServer-20160704_1411-V6.2.1.zip') }
          end
          context 'job server service set up in init.d' do
            it { is_expected.to contain_File('/etc/init.d/jobserver') }
            it { is_expected.to contain_Exec('chkconfig') }
          end
          context 'user and group created' do
            it { is_expected.to contain_user('talenduser') }
            it { is_expected.to contain_group('talendgroup') }
          end
        end
      end
    end
  end
end
