# thank you for the letter!
postfix:
  enable_service: True
  manage_master_config: True
  master_config:
    enable_submission: False

  config:
    smtpd_banner: $myhostname ESMTP $mail_name
    biff: 'no'
    append_dot_mydomain: 'no'
    readme_directory: 'no'
    # The hostname of this server
    myhostname: oregano.nogweii.xyz
    # The primary domain of all the email
    mydomain: nogweii.xyz
    # When looking up local users (i.e. just the 'user' of 'user@example'), use the following domains:
    mydestination: $myhostname, localhost.$mydomain, localhost, $mydomain
    relayhost: ''
    mynetworks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    mailbox_size_limit: 0
    recipient_delimiter: +
    inet_interfaces: all
