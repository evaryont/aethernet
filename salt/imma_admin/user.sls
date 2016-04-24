{{ pillar['administrivia']['ssh_group'] }}:
  group.present:
    - gid: 3001
    - system: true
    {% if '.dev.' in grains['id'] %}
    - addusers:
      - vagrant
    {% endif %}

{{ pillar['administrivia']['sudo_group'] }}:
  group.present:
    - system: true
    - addusers:
      - {{ pillar['administrivia']['admin_name'] }}
    {% if '.dev.' in grains['id'] %}
      - vagrant
    {% endif %}
    - require:
      - group: local admin group {{ pillar['administrivia']['admin_name'] }}

local admin group {{ pillar['administrivia']['admin_name'] }}:
  group.present:
    - name: {{ pillar['administrivia']['admin_name'] }}
    - gid: 5001
    - system: true

local admin user {{ pillar['administrivia']['admin_name'] }}:
  user.present:
    - name: {{ pillar['administrivia']['admin_name'] }}
    - fullname: Colin 'Evs' Shea
    - shell: /bin/zsh
    - uid: 5001
    - gid: {{ pillar['administrivia']['admin_name'] }}
    - groups:
      - {{ pillar['administrivia']['ssh_group'] }}
      - {{ pillar['administrivia']['sudo_group'] }}
