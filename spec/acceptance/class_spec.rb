require 'spec_helper_acceptance'

describe 'talend_job_server class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'talend_job_server':
        cmdline_url => 'https://foobar.com/cmdline.zip',
        license_url => 'https://foobar.com/license',
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('talend_job_server') do
      it { is_expected.to be_installed }
    end

    describe service('talend_job_server') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
