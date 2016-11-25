# == Class talend_job_server::service
#
# This class is meant to be called from talend_job_server.
# It ensure the service is running.
#
class talend_job_server::service (
  $talend_job_server_home,
  $talend_job_server_subfolder,
  $talend_job_server_user,
){
  file { '/etc/init.d/jobserver':
    ensure  => file,
    content => template('talend_job_server/jobserver.erb'),
    mode    => '0755',
  } ~>
  exec { 'chkconfig':
    command => '/sbin/chkconfig --add jobserver',
  } ~>
  exec { 'restart':
    command => '/etc/init.d/jobserver restart',
  }
}
