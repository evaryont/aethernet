{{ pillar['administrivia']['ssh_group'] }}:
  group.present:
    - gid: 3001
    - system: true
    - addusers:
      {{ pillar['administrivia']['extra_users']['ssh'] }}

{{ pillar['administrivia']['sudo_group'] }}:
  group.present:
    - system: true
    - addusers:
      {{ pillar['administrivia']['extra_users']['sudo'] }}

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
    - require:
      - group: local admin group {{ pillar['administrivia']['admin_name'] }}
      - group: {{ pillar['administrivia']['ssh_group'] }}
      - group: {{ pillar['administrivia']['sudo_group'] }}

local admin ssh key gazelle:
  ssh_auth.present:
    - user: {{ pillar['administrivia']['admin_name'] }}
    - name: AAAAC3NzaC1lZDI1NTE5AAAAII5+emKQ34nJzrwc3u3gCk8A7rJBHHKAj46GGPvhzuI8
    - enc: ssh-ed25519
    - comment: Gazelle access to Aether
