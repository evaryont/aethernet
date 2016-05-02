owncloud db user:
  mysql_user.present:
    - name: {{ pillar['owncloud:user'] }}
    - host: localhost
    - password: {{ pillar['owncloud:password'] }}

owncloud db:
  mysql_database.present:
    - name: {{ pillar['owncloud:database'] }}
    - require:
      - mysql_user: {{ pillar['owncloud:user'] }}
  mysql_grants.present:
    - grant: all privileges
    - database:  {{ pillar['owncloud:database'] }}.*
    - host: localhost
    - user: {{ pillar['owncloud:user'] }}
    - require:
      - mysql_database: {{ pillar['owncloud:database'] }}
