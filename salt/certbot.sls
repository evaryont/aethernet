certbot-git:
  git.latest:
    - name: https://github.com/certbot/certbot/
    - target: {{ salt['pillar.get']('letsencrypt:cli_install_dir') }}

{{ salt['pillar.get']('letsencrypt:webroot') }}:
  file.directory

{%- for domain in salt['pillar.get']('letsencrypt:domains') %}
le-{{ domain }}:
  acme.cert:
    - name: {{ domain }}
    #- aliases:
    #  - gitlab.example.com
    - email: {{ salt['pillar.get']('letsencrypt:email') }}
    - webroot: {{ salt['pillar.get']('letsencrypt:webroot') }}
    - renew: 14
    - fire_event: acme/{{ domain }}
{%- end %}
