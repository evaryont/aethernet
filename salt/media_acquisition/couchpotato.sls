{% set id_num = 5501 %}

couchpotato users:
  user.present:
    - name: couchpotato
    - fullname: Couch Potato
    - shell: /bin/false
    - system: true
    - uid: {{ id_num }}
    - gid: {{ id_num }}

/etc/mediaapps/couchpotato:
  file.directory:
    - makedirs: true
    - user: {{ id_num }}
    - group: {{ id_num }}
    - mode: 755

/srv/couchpotato/downloads:
  file.directory:
    - makedirs: true
    - user: {{ id_num }}
    - group: {{ id_num }}
    - mode: 755

/srv/couchpotato/movies:
  file.directory:
    - makedirs: true
    - user: {{ id_num }}
    - group: {{ id_num }}
    - mode: 755
