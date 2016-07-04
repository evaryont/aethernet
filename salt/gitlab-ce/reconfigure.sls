/etc/gitlab/gitlab.rb:
  file.managed:
    - source: salt://gitlab-ce/files/gitlab.j2
    - user: root
    - group: root
    - mode: 600
    - template: jinja

Reconfigure gitlab:
  cmd.run:
    - name: gitlab-ctl reconfigure
    - cwd: /
    - onchanges:
      - file: /etc/gitlab/gitlab.rb
