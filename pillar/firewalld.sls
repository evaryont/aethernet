{% import_yaml "firewall_services.yaml" as firewall_services %}

firewalld:
  enabled: True
  default_zone: public
  services:
    salt-master:
      short: salt-master
      description: Salt is a Python-based open source configuration management software and remote execution engine.
      ports:
        tcp:
          - 4505
          - 4506
    upnp:
      short: upnp
      description: Universal Plug-n-Play is a standard to discover and manipulate lots of stuff.
      ports:
        udp:
          - 1900
      destination:
        ipv4:
          - 239.255.255.250
    kodi:
      short: kodi
      description: Kodi is an award winning software media center for playing videos, music, pictures, games and more.
      ports:
        tcp:
          - 1135
          - 1263
          - 1438
          - 1778
          - 8080 # Kodi's HTTP web remote, websockets, and JSON-RPC
          - 9090
        udp:
          - 1900
          - 1657
          - 9777 # Kodi's event server, allowing remote input
  zones:
    public:
      short: Public
      description: "For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted."
      services:
        - salt
        - dhcpv6-client
        {% for fw_service in firewall_services.services[grains['id']]|default([]) %}
        - {{ fw_service }}
        {% endfor %}
