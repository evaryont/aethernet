gitlab:
  external_url: 'https://library.evaryont.me'
  registry_external_url: 'https://r.library.evaryont.me'
  git_data_dir: "/var/opt/gitlab/git-data"

  config:
    gitlab_rails:
      time_zone: 'UTC'
      lfs_enabled: true
      manage_backup_path: true
      artifacts_enabled: true
      ldap_enabled: false
      kerberos_enabled: false
      omniauth_enabled: false
      initial_root_password: "sponsored by money"
      registry_enabled: true
    registry_nginx:
      ssl_certificate: "/etc/letsencrypt/live/r.library.evaryont.me/fullchain.pem"
      ssl_certificate_key: "/etc/letsencrypt/live/r.library.evaryont.me/privkey.pem"
    gitlab_workhorse:
      enable: true
    user:
      git_user_name: Gitlab
      git_user_email: git@evaryont.me
    unicorn:
      worker_processes: 2
    sidekiq:
      concurrency: 25
    gitlab_shell:
      audit_usernames: true
    postgresql:
      enable: true
    redis:
      enable: true
    nginx:
      enable: true
      redirect_http_to_https: false # custom config below will handle this
      custom_nginx_config: "include /etc/nginx.lehttp.conf;"
      ssl_certificate: "/etc/letsencrypt/live/library.evaryont.me/fullchain.pem"
      ssl_certificate_key: "/etc/letsencrypt/live/library.evaryont.me/privkey.pem"
    logrotate:
      enable: true
    manage_accounts:
      enable: true
    manage_storage_directories:
      enable: true
    mattermost:
      enable: false

letsencrypt:
  domains:
    - library.evaryont.me
    - r.library.evaryont.me
