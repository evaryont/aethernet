common_packages:
  happy_admin:
    - vim # Best editor
    - vim-runtime # supporting files for the best editor
    - vim-spell-en # english spell check files

  salt_dependencies:
    - python2-dbus # So salt can interact with systemd DBUS APIs
    - python2-pygit2 # Salt's gitfs support
    - python2-ndg-httpsclient # Support HTTPS requests
    - python2-pyopenssl # More modern openssl wrapper
    - python2-augeas # Bindings for augeas
