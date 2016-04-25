/etc/systemd/system/auth_keys_dl.timer:
  file.managed:
    - source: salt://imma_admin/files/auth_keys_dl.timer
    - mode: 0644
    - user: root
    - group: root
    - template: jinja

/etc/systemd/system/auth_keys_dl.service:
  file.managed:
    - source: salt://imma_admin/files/auth_keys_dl.service
    - mode: 0644
    - user: root
    - group: root
    - template: jinja

auth_keys_dl.timer:
  service.enabled

github.com:
  ssh_known_hosts.present:
    - user: {{ pillar['administrivia']['admin_name'] }}

admin dotfiles:
  git.latest:
    - name: https://github.com/evaryont/dotfiles.git
    - target: /home/{{ pillar['administrivia']['admin_name'] }}/dotfiles
    - user: {{ pillar['administrivia']['admin_name'] }}
    - submodules: True
    - force_clone: True
    - force_checkout: True
    - force_fetch: True
    - force_reset: True
    - depth: 1
    - require:
      - user: {{ pillar['administrivia']['admin_name'] }}

rake dotfiles:
  cmd.wait:
    - name: /usr/bin/rake
    - cwd: /home/{{ pillar['administrivia']['admin_name'] }}/dotfiles
    - user: {{ pillar['administrivia']['admin_name'] }}
    - group: {{ pillar['administrivia']['admin_name'] }}
    - watch:
      - git: admin dotfiles
    - require:
      - user: {{ pillar['administrivia']['admin_name'] }}
