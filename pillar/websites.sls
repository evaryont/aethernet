{%- set web_dir = "/opt/blog" %}

letsencrypt:
  domains:
    - evaryont.me

personal_website_dir: {{ web_dir }}
nginx:
  ng:
    vhosts:
      managed:
        evaryont_me:
          enabled: true
          config:
            - server:
              - server_name: evaryont.me
              - listen:
                - 80
              - etag: "on"
              - root: {{ web_dir }}
              - location /:
                - index: index.html
                - autoindex: "off"
                - expires: 21d
              - location /assets:
                - expires: max
