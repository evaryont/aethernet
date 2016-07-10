sudoers:
  users:
    frogger:
      - 'ALL=(ALL) ALL'

administrivia:
  extra_users:
    sudo:
      - frogger
    ssh:
      - frogger
