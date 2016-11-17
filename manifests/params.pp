# == Class talend_job_server::params
#
# This class is meant to be called from talend_job_server.
# It sets variables according to platform.
#
class talend_job_server::params {
  $talend_job_server_url       = undef
  $talend_job_server_home      = '/opt/talend_job_server'
  $talend_job_server_subfolder = 'Talend-JobServer-20160704_1411-V6.2.1'
  $talend_job_server_user      = 'talenduser'
  $talend_job_server_group     = 'talendgroup'
  $manage_user                 = true
  $manage_group                = true
  $use_ssl                     = true
  $disabled_cipher_suites      = 'TLS_KRB5_WITH_3DES_EDE_CBC_MD5,TLS_KRB5_WITH_RC4_128_SHA,SSL_DH_anon_WITH_DES,CBC_SHA,TLS_DH_anon_WITH_AES_128_CBC_SHA,SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_EXPORT_WITH_RC4_40_MD5,SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA,TLS_KRB5_WITH_3DES_EDE_CBC_SHA,SSL_RSA_WITH_RC4_128_SHA,TLS_KRB5_WITH_DES_CBC_MD5,TLS_KRB5_EXPORT_WITH_RC4_40_MD5,TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5,SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA,TLS_KRB5_EXPORT_WITH_RC4_40_SHA,SSL_DH_anon_EXPORT_WITH_RC4_40_MD5,SSL_DHE_DSS_WITH_DES_CBC_SHA,TLS_KRB5_WITH_DES_CBC_SHA,SSL_RSA_WITH_NULL_MD5,SSL_DH_anon_WITH_3DES_EDE_CBC_SHA,SSL_DHE_RSA_WITH_DES_CBC_SHA,TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA,SSL_DH_anon_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_WITH_NULL_SHA,TLS_KRB5_WITH_RC4_128_MD5,SSL_RSA_WITH_DES_CBC_SHA,TLS_EMPTY_RENEGOTIATION_INFO_SCSV,SSL_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_DH_anon_WITH_RC4_128_MD5,SSL_RSA_WITH_RC4_128_MD5,SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA,SSL_RSA_WITH_3DES_EDE_CBC_SHA'
  $username                    = undef
  $password                    = undef
  case $::osfamily {
    'Debian', 'RedHat', 'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
