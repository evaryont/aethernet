{% if salt['grains.get']('os_family') == 'Arch' %}
# When on arch, just rely on the package existing
certbot:
  pkg.latest
{% else %}
# On centos and other OS's, clone the git repo
certbot-git:
  git.latest:
    - name: https://github.com/certbot/certbot/
    - target: {{ salt['pillar.get']('letsencrypt:cli_install_dir') }}
{% endif %}

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
{%- endfor %}
