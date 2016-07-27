# hello!
dovecot:
  lookup:
    enable_service_control: True
    packages: ['dovecot', 'pigeonhole']
    config:
      local: |
        # /etc/dovecot/dovecot.conf is managed by salt. go check the pillar!
        !include conf.d/*.conf
      conf: 
        02-ssl: |
          ssl_protocols = !SSLv2 !SSLv3
          ssl_cipher_list = ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
          ssl_prefer_server_ciphers = yes
          ssl_dh_parameters_length = 2048
        04-master: |
          service imap-login {
            inet_listener imap {
            }
            inet_listener imaps {
            }
          }
          service lmtp {
            unix_listener lmtp {
            }
          }
          service imap {
          }
          service auth {
            unix_listener auth-userdb {
            }
          }
          service auth-worker {
          }
          service dict {
            unix_listener dict {
            }
          }
        05-mail: |
          mail_location = maildir:~/Maildir
          namespace inbox {
            inbox = yes
          }
        11-lda: "protocol lda { }"
	12-mailboxes: |
          namespace inbox {
            mailbox Drafts {
              special_use = \Drafts
            }
            mailbox Junk {
              special_use = \Junk
            }
            mailbox Trash {
              special_use = \Trash
            }
            mailbox Sent {
              special_use = \Sent
            }
            mailbox "Sent Messages" {
              special_use = \Sent
            }
          }
        21-lda: "protocol lmtp { }"
        22-imap: "protocol imap { }"
