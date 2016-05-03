common_packages:
  happy_admin:
    - htop # Generally useful utility
    - zsh # Favorite shell
    - ruby # a favorite language of mine
    - git # Powerful VCS
  {% if grains['os_family'] == 'Arch' %}
    - vim # Best editor
    - vim-runtime # supporting files for the best editor
    - vim-spell-en # english spell check files
  {% elif grains['os_family'] == 'RedHat' %}
    - vim-enhanced
    - vim-filesystem
  {% endif %}
  {% if grains['os_family'] == 'RedHat' %}
    - rubygem-rake
    - ruby-doc
    - ruby-devel
    - ruby-irb
    - rubygems
  {% endif %}

  salt_dependencies:
  {% if grains['os_family'] == 'Arch' %}
      - python2-dbus # So salt can interact with systemd DBUS APIs
      - python2-pygit2 # Salt's gitfs support
      - python2-ndg-httpsclient # Support HTTPS requests
      - python2-pyopenssl # More modern openssl wrapper
      - python2-augeas # Bindings for augeas
  {% elif grains['os_family'] == 'RedHat' %}
      - dbus-python
      - python-pygit2
      - python-ndg_httpsclient
      - pyOpenSSL
      - python-augeas
  {% endif %}

  sys_utils:
      - dmidecode # Generally useful utility
      - wget # Useful CLI downloading tool
      - augeas # Smart file editing
