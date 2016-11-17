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
  # setup talend_job_server service using supervisord
  class { '::supervisord':
    install_init => true,
    install_pip  => true,
  }
  supervisord::program { 'talend_job_server':
    command   => "${talend_job_server_home}/${talend_job_server_subfolder}/start_rs.sh",
    priority  => '100',
    directory => "${talend_job_server_home}/${talend_job_server_subfolder}",
    user      => $talend_job_server_user,
  }
}
