[![Build Status](https://img.shields.io/travis/williamtsoi1/puppet-talend_job_server.svg)](https://travis-ci.org/williamtsoi1/puppet-talend_job_server)

# Overview

This module is used to install Talend Job Server, as well as install a service using supervisord.

# Module Description

This module will:
* Download and extract a copy of Talend Job Server from a given URL
* Manage and create (if required) a user and group used to run the Talend Job Server service
* Install supervisord, used to run the Talend Job Server process
* Configure the Talend Job Server as a program within supervisord
* Start the Talend Job Server service

# Usage

## Basic (minimal) setup
~~~~
class { '::talend_job_server':
  talend_job_server_url => 'http://foo.com/Talend-Job-Server-20160704_1411-V6.2.1.zip',
}
~~~~

## Custom Setup with all parameters
~~~~
class { '::talend_job_server':
  talend_job_server_url       => undef,
  talend_job_server_home      => '/opt/talend_job_server',
  talend_job_server_subfolder => 'Talend-JobServer-20160704_1411-V6.2.1',
  talend_job_server_user      => 'talenduser',
  talend_job_server_group     => 'talendgroup',
  manage_user                 => true,
  manage_group                => true,
  use_ssl                     => true,
  disabled_cipher_suites      => 'TLS_KRB5_WITH_3DES_EDE_CBC_MD5,TLS_KRB5_WITH_RC4_128_SHA,SSL_DH_anon_WITH_DES,CBC_SHA,TLS_DH_anon_WITH_AES_128_CBC_SHA,SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_EXPORT_WITH_RC4_40_MD5,SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA,TLS_KRB5_WITH_3DES_EDE_CBC_SHA,SSL_RSA_WITH_RC4_128_SHA,TLS_KRB5_WITH_DES_CBC_MD5,TLS_KRB5_EXPORT_WITH_RC4_40_MD5,TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5,SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA,TLS_KRB5_EXPORT_WITH_RC4_40_SHA,SSL_DH_anon_EXPORT_WITH_RC4_40_MD5,SSL_DHE_DSS_WITH_DES_CBC_SHA,TLS_KRB5_WITH_DES_CBC_SHA,SSL_RSA_WITH_NULL_MD5,SSL_DH_anon_WITH_3DES_EDE_CBC_SHA,SSL_DHE_RSA_WITH_DES_CBC_SHA,TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA,SSL_DH_anon_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_WITH_NULL_SHA,TLS_KRB5_WITH_RC4_128_MD5,SSL_RSA_WITH_DES_CBC_SHA,TLS_EMPTY_RENEGOTIATION_INFO_SCSV,SSL_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_DH_anon_WITH_RC4_128_MD5,SSL_RSA_WITH_RC4_128_MD5,SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA,SSL_RSA_WITH_3DES_EDE_CBC_SHA',
  username                    => 'talendjobserver',
  password                    => 'password',
}
~~~~


# Limitations

TODO: This is where you list OS compatibility, version compatibility, etc.

# Development

TODO: Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.
