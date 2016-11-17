# == Class talend_job_server::config
#
# This class is called from talend_job_server for service config.
#
class talend_job_server::config (
  $talend_job_server_home,
  $talend_job_server_subfolder,
  $talend_job_server_user,
  $talend_job_server_group,
  $use_ssl,
  $disabled_cipher_suites,
  $username,
  $password,
){
  # config file
  file_line { 'file_line_use_ssl':
    ensure => present,
    path   => "${talend_job_server_home}/${talend_job_server_subfolder}/conf/TalendJobServer.properties",
    line   => "org.talend.remote.jobserver.server.TalendJobServer.USE_SSL=${use_ssl}",
    match  => 'org.talend.remote.jobserver.server.TalendJobServer.USE_SSL=',
  }

  file_line { 'file_line_disabled_cipher_suites':
    ensure => present,
    path   => "${talend_job_server_home}/${talend_job_server_subfolder}/conf/TalendJobServer.properties",
    line   => "org.talend.remote.jobserver.server.TalendJobServer.DISABLED_CIPHER_SUITES=${disabled_cipher_suites}",
    match  => 'org.talend.remote.jobserver.server.TalendJobServer.DISABLED_CIPHER_SUITES=',
  }

  if $username != undef and $password != undef {
    file { "${talend_job_server_home}/${talend_job_server_subfolder}/conf/users.csv":
      mode    => '0600',
      content => "${username},${password}",
    }
  }
}
