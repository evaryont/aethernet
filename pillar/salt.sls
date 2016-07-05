salt:
  install_packages: True
  master:
    file_roots:
      base:
        - /srv/aethernet/salt
        - /srv/aethernet/formulas/salt-formula
        - /srv/aethernet/formulas/openssh-formula
        - /srv/aethernet/formulas/ntp-formula
        - /srv/aethernet/formulas/sudoers-formula
        - /srv/aethernet/formulas/firewalld-formula
        - /srv/aethernet/formulas/nginx-formula
    pillar_roots:
      base:
        - /srv/aethernet/pillar
    auto_accept: True
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
    master: 10.20.30.11
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
