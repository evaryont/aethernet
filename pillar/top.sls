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

  'library.evaryont.me or gitlab.dev.*':
    - gitlab

  '*.dev.*':
    - overrides.vagrant
