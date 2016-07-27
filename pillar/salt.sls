{% set basedir = '/srv/aethernet' %}

salt:
  install_packages: True
  master:
    basedir: {{ basedir }}
    file_roots:
      base:
        - {{ basedir }}/salt
        - {{ basedir }}/formulas/salt-formula
        - {{ basedir }}/formulas/openssh-formula
        - {{ basedir }}/formulas/ntp-formula
        - {{ basedir }}/formulas/sudoers-formula
        - {{ basedir }}/formulas/firewalld-formula
        - {{ basedir }}/formulas/nginx-formula
        - {{ basedir }}/formulas/dovecot-formula
        - {{ basedir }}/formulas/postfix-formula
        - {{ basedir }}/formulas/php-formula
    pillar_roots:
      base:
        - {{ basedir }}/pillar
    hash_type: sha256
    state_verbose: False
    state_output: "changes"
    state_output_profile: True
    state_output_diff: False
    state_aggregate: True
    state_events: True
    pillar_merge_lists: True
    worker_threads: 3
  minion:
    master: evaryont.me
    hash_type: "sha256"
    state_verbose: False
    state_output: "changes"
    state_output_profile: True
    state_output_diff: False
    state_aggregate: True
    state_events: True
    pillar_merge_lists: True

# Required for openssh.known_hosts
mine_functions:
  public_ssh_host_keys:
    mine_function: cmd.run
    cmd: cat /etc/ssh/ssh_host_*_key.pub
  public_ssh_hostname:
    mine_function: grains.get
    key: id
