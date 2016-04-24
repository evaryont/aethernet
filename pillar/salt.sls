salt:
  install_packages: True
  master:
    #fileserver_backend:
    #  - git
    #  - roots
    file_roots:
      base:
        - /srv/salt
        - /srv/salt/formulas/salt-formula
    pillar_roots:
      base:
        - /srv/pillar
    auto_accept: True
    hash_type: sha256
    state_aggregate: True
  minion:
    master: 10.20.30.11
    hash_type: "sha256"
    state_verbose: False
    state_output: "changes"
    state_output_profile: True
    state_output_diff: False

salt_formulas:
  list:
    base:
      - salt-formula
      - openssh-formula
