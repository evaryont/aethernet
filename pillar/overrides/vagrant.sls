administrivia:
  extra_users:
    sudo:
      - vagrant
    ssh:
      - vagrant

salt:
  minion:
    master: 10.20.30.11

gitlab:
  external_url: 'http://gitlab.dev.aether.nu'
  mattermost_external_url: 'http://chat.gitlab.dev.aether.nu'
  pages_external_url: 'http://pages.gitlab.dev.aether.nu'
