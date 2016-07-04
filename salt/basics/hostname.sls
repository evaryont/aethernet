/etc/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents_grains: id
