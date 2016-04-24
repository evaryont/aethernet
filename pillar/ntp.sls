ntp:
  ng:
    settings:
      ntpd: True
      ntp_conf:
        server:
          - 0.arch.pool.ntp.org
          - 1.arch.pool.ntp.org
          - 2.arch.pool.ntp.org
          - 3.arch.pool.ntp.org
        restrict: ["restrict default kod limited nomodify nopeer noquery notrap", '127.0.0.1', '::1']
        driftfile: ['/var/lib/ntp/ntp.drift']
        disable: ['monitor']
