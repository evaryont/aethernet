base:
  '*': # The vitamins & minerals every server loves!
    - basics.common_packages
    - basics.timezone
    - basics.hostname
    - basics.locale
    - salt.minion
    - basics.salt_tweaks
    - openssh
    - openssh.client
    - openssh.config
    - openssh.known_hosts
    - ntp.ng
    - imma_admin
    - sudoers
    - firewalld

  # Here begins the node-specific formulas:
  'master.*':
    - salt.master

  'evaryont.me':
    - salt.master
    - personal_site

  'gitlab.dev.*':
    - gitlab-ce

  'library.evaryont.me':
    - gitlab-ce
