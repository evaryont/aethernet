{% import_yaml 'admin_names.yaml' as admin_vars %}

sudoers:
  users:
    root:
      - 'ALL=(ALL) ALL'
    {{ admin_vars.admin_name }}:
      - 'ALL=(ALL) ALL'
  groups:
    {{ admin_vars.sudo_group }}:
      {% if '.dev.' in grains['id'] %} # if we're in a dev box, don't ask for passwords
      - 'ALL=(ALL) NOPASSWD: ALL'
      {% else %}
      - 'ALL=(ALL) ALL'
      {% endif %}
  defaults:
    generic:
      - env_reset
      - env_editor
      - insults
      - '!lecture'
      - secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      - tty_tickets
      # Keep a variety of environment variables inside sudo sessions
      - env_keep += "LANG LANGUAGE LINGUAS LC_* _XKB_CHARSET"
      - env_keep += "XMODIFIERS GTK_IM_MODULE QT_IM_MODULE QT_IM_SWITCHER"
      - env_keep += "XDG_SESSION_COOKIE"

