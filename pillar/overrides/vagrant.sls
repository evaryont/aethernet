administrivia:
  extra_users:
    sudo:
      - vagrant
    ssh:
      - vagrant

salt:
  master:
    auto_accept: True
  minion:
    master: 10.20.30.11

letsencrypt:
  domains: false # re-set the default value to disable certbot magic

gitlab:
  external_url: 'http://gitlab.dev.aether.nu'
  mattermost_external_url: 'http://chat.gitlab.dev.aether.nu'
  pages_external_url: 'http://pages.gitlab.dev.aether.nu'
  config:
    nginx:
      custom_nginx_config: "# overriden for dev. no encryption"
      ssl_certificate: ""
      ssl_certificate_key: ""
    registry_nginx:
      ssl_certificate: ""
      ssl_certificate_key: ""
