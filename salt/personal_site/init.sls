include:
  - nginx.ng.init

{% from 'nginx/ng/map.jinja' import nginx with context %}

website files:
  git.latest:
    - name: https://github.com/evaryont/evaryont.github.io.git
    - rev: master
    - target: {{ pillar['personal_website_dir'] }}
    - submodules: False
    - force_clone: True
    - force_checkout: True
    - force_fetch: True
    - force_reset: True

link to help me find the site:
  file.symlink:
    - name: /home/{{ pillar['administrivia']['admin_name'] }}/blog
    - target: {{ pillar['personal_website_dir'] }}
