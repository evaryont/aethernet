{% set id_num = 5502 %}

sonarr users:
  user.present:
    - name: sonarr
    - fullname: Sonarr
    - shell: /bin/false
    - system: true
    - uid: {{ id_num }}
    - gid: {{ id_num }}

/etc/mediaapps/sonarr:
  file.directory:
    - makedirs: true
    - user: {{ id_num }}
    - group: {{ id_num }}
    - mode: 755

/srv/sonarr/downloads:
  file.directory:
    - makedirs: true
    - user: {{ id_num }}
    - group: {{ id_num }}
    - mode: 755

/srv/sonarr/tv:
  file.directory:
    - makedirs: true
    - user: {{ id_num }}
    - group: {{ id_num }}
    - mode: 755

