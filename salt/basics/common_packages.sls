Install common packages:
  pkg.installed:
    - pkgs:
      - python2-dbus # So salt can interact with systemd DBUS APIs
      - python2-pygit2 # Salt's gitfs support
      - python2-ndg-httpsclient # Support HTTPS requests
      - python2-pyopenssl # More modern openssl wrapper
      - dmidecode # Generally useful utility
      - htop # Generally useful utility
      - zsh # Favorite shell
      - vim # Best editor
      - vim-runtime # supporting files for the best editor
      - vim-spell-en # english spell check files
      - ruby # a favorite language of mine
      - git # Powerful VCS
