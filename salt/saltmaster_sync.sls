{% from "salt/map.jinja" import salt_settings with context %}

saltmaster sync files:
  git.latest:
    - name: https://github.com/evaryont/aethernet.git
    - rev: base
    - target: {{ pillar['salt']['master']['basedir'] }}
    - user: {{ pillar['administrivia']['admin_name'] }}
    - submodules: True
    - force_clone: True
    - force_checkout: True
    - force_fetch: True
    - force_reset: True
    - watch_in:
      - service: {{ salt_settings.master_service }}
