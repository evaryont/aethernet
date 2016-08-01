base:
  'os_family:RedHat':
    - match: grain
    - epel

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

  # Only select minions that actually have a LE domain set
  'not I@letsencrypt:domains:false':
    - match: compound
    - certbot

  # Here begins the node-specific formulas:
  'master.*':
    - salt.master

  'evaryont.me':
    - salt.master
    - saltmaster_sync
    - personal_site

  'gitlab.dev.*':
    - gitlab-ce

  'library.evaryont.me':
    - gitlab-ce

  'mail.dev.aether.nu or oregano.nogweii.xyz':
    - postfix
    - dovecot
    - mail

  'frog.aether.nu':
    - media_acquisition
