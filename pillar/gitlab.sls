gitlab:
  external_url: 'http://library.evaryont.me'
  mattermost_external_url: 'http://corvus.pub'
  pages_external_url: 'http://pages.corvus.club'
  registry_external_url: 'http://r.library.evaryont.me'
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
    registry:
      enable: false
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
    logrotate:
      enable: true
    manage_accounts:
      enable: true
    manage_storage_directories:
      enable: true
    mattermost:
      enable: false
