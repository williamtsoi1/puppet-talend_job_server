# == Class talend_job_server::install
#
# This class is called from talend_job_server for install.
#
class talend_job_server::install (
  $talend_job_server_url,
  $talend_job_server_home,
  $talend_job_server_subfolder,
  $talend_job_server_user,
  $talend_job_server_group,
  $manage_user,
  $manage_group,
){
  include ::staging

  # create users and groups if required
  if $manage_user {
    ensure_resource('user', $talend_job_server_user, {
      ensure => present,
      gid    => $talend_job_server_group,
    })
  }
  if $manage_group {
    ensure_resource('group', $talend_job_server_group, {
      ensure => present,
    })
  }

  # Create talend_job_server home folder
  mkdir::p { $talend_job_server_home:
    owner        => $talend_job_server_user,
    group        => $talend_job_server_group,
    mode         => '0744',
    declare_file => true,
  }

  # install talend_job_server
  staging::deploy { "${talend_job_server_subfolder}.zip":
    source  => $talend_job_server_url,
    target  => $talend_job_server_home,
    user    => $talend_job_server_user,
    group   => $talend_job_server_group,
    require => File[$talend_job_server_home],
  }
}
