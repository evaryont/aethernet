letsencrypt:
  email: nogui+letsencrypt@evaryont.me
  cli_install_dir: /opt/certbot
  webroot: /var/opt/acme-challenges
  domains: false # default value, override it in other pillars as a list
