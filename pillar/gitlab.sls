gitlab:
  external_url: 'http://gitlab.dev.aether.nu'
  mattermost_external_url: 'http://chat.gitlab.dev.aether.nu'
  pages_external_url: 'http://pages.gitlab.dev.aether.nu'

  config:
    gitlab_rails:
      time_zone: 'UTC'
      lfs_enabled: true
      manage_backup_path: true
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
      listen_address: null
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
      enable: true
