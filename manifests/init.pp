# Class: talend_job_server
# ===========================
#
#
# Parameters
# ----------
#
# * `tomcat_service_name`
#   The name of the service of the running Tomcat. This service will be restarted
#   after configuration of Talend Administration Center
#

class talend_job_server (
  $talend_job_server_url       = $::talend_job_server::params::talend_job_server_url,
  $talend_job_server_home      = $::talend_job_server::params::talend_job_server_home,
  $talend_job_server_subfolder = $::talend_job_server::params::talend_job_server_subfolder,
  $talend_job_server_user      = $::talend_job_server::params::talend_job_server_user,
  $talend_job_server_group     = $::talend_job_server::params::talend_job_server_group,
  $manage_user                 = $::talend_job_server::params::manage_user,
  $manage_group                = $::talend_job_server::params::manage_group,
  $use_ssl                     = $::talend_job_server::params::use_ssl,
  $disabled_cipher_suites      = $::talend_job_server::params::disabled_cipher_suites,
  $username                    = $::talend_job_server::params::username,
  $password                    = $::talend_job_server::params::password,
) inherits ::talend_job_server::params {

  # validate parameters here
  validate_string($talend_job_server_url)
  validate_string($talend_job_server_home)
  validate_string($talend_job_server_subfolder)
  validate_string($talend_job_server_user)
  validate_string($talend_job_server_group)
  validate_bool($manage_user)
  validate_bool($manage_group)
  validate_bool($use_ssl)
  validate_string($disabled_cipher_suites)

  class { '::talend_job_server::install':
    talend_job_server_url       => $talend_job_server_url,
    talend_job_server_home      => $talend_job_server_home,
    talend_job_server_subfolder => $talend_job_server_subfolder,
    talend_job_server_user      => $talend_job_server_user,
    talend_job_server_group     => $talend_job_server_group,
    manage_user                 => $manage_user,
    manage_group                => $manage_group,
  } ->
  class { '::talend_job_server::config':
    talend_job_server_home      => $talend_job_server_home,
    talend_job_server_subfolder => $talend_job_server_subfolder,
    talend_job_server_user      => $talend_job_server_user,
    talend_job_server_group     => $talend_job_server_group,
    use_ssl                     => $use_ssl,
    disabled_cipher_suites      => $disabled_cipher_suites,
    username                    => $username,
    password                    => $password,
  } ~>
  class { '::talend_job_server::service':
    talend_job_server_home      => $talend_job_server_home,
    talend_job_server_subfolder => $talend_job_server_subfolder,
    talend_job_server_user      => $talend_job_server_user,
  } ->
  Class['::talend_job_server']
}
