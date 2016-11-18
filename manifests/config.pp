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
  $jvm_settings,
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

  # Talend doesn't seem to know how to spell their variable names :(
  file_line {'jvm_settings':
    ensure => present,
    path   => "${talend_job_server_home}/${talend_job_server_subfolder}/start_rs.sh",
    line   => "MY_JMV_ARGS=\"${jvm_settings} \"",
    match  => 'MY_JMV_ARGS',
  }

  if $username != undef and $password != undef {
    file { "${talend_job_server_home}/${talend_job_server_subfolder}/conf/users.csv":
      mode    => '0600',
      content => "${username},${password}",
    }
  }
}
