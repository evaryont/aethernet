base:
  '*':
    - common_packages
    - common_packages.{{ grains['os_family'] }}
    - salt
    - openssh
    - ntp
    - administrivia
    - sudo
    - firewalld
    - letsencrypt

  'evaryont.me or master.dev.*':
    - match: compound
    - websites

  'frog.aether.nu':
    - overrides.frog
    - media_acquisition

  'library.evaryont.me or gitlab.dev.*':
    - gitlab

  'mail.dev.aether.nu or oregano.nogweii.xyz':
    - mail.dovecot
    - mail.postfix

  ## Environment overrides ##
  # THIS MUST BE LAST
  '*.dev.*':
    - overrides.vagrant
