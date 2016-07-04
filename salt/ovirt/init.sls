/opt/ovirt.answers:
  file.managed:
    - replace: False
    - source: salt://ovirt/files/answers.j2
    - template: jinja
