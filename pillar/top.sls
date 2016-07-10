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

  'evaryont.me or master.dev.*':
    - match: compound
    - websites

  'frog.aether.nu':
    - overrides.frog
