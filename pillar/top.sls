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
