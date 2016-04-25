salt:
  install_packages: True
  master:
    file_roots:
      base:
        - /srv/salt
        - /srv/formulas/salt-formula
        - /srv/formulas/openssh-formula
        - /srv/formulas/ntp-formula
        - /srv/formulas/sudoers-formula
        - /srv/formulas/firewalld-formula
        - /srv/formulas/owncloud-formula
    pillar_roots:
      base:
        - /srv/pillar
    auto_accept: True
    hash_type: sha256
  minion:
    master: 10.20.30.11
    hash_type: "sha256"
    state_verbose: False
    state_output: "changes"
    state_output_profile: True
    state_output_diff: False
    state_aggregate: True
    state_events: True
