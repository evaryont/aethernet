/etc/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents_grains: id

Immeidately set hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ salt['grains.get']('id') }}
    - cwd: /
    - onchanges:
      - file: /etc/hostname
    - onlyif: which hostnamectl &>/dev/null
