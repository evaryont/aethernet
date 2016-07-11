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
    kodi:
      short: kodi
      description: Kodi is an award winning software media center for playing videos, music, pictures, games and more.
      ports:
        tcp:
          - 8080 # Kodi's HTTP web remote, websockets, and JSON-RPC
          - 1135 # UPnP
  zones:
    public:
      short: Public
      description: "For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted."
      services:
        - ssh
        - dhcpv6-client

# And thanks to pillar_merge_lists, we can easily layer the list of services
firewalld:
  zones:
    public:
      services: {{ firewall_services[grains['id']] | default('') }}
