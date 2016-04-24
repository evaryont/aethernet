{% import_yaml 'admin_names.yaml' as admin_vars %}

sudoers:
  users:
    {{ admin_vars.admin_name }}:
      - 'ALL=(ALL) ALL'
  defaults:
    generic:
      - env_reset
      - env_editor
      - insults
      - '!lecture'
      - secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      - tty_tickets

