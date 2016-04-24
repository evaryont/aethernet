/etc/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - content_grains: id
