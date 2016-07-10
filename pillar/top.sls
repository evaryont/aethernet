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
    - imma_admin

  '*.dev.*':
    - overrides.vagrant

  'evaryont.me or master.dev.*':
    - match: compound
    - websites

  'frog.aether.nu':
    - overrides.frog
