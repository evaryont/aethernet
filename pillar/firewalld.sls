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
  zones:
    public:
      short: Public
      description: "For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted."
      services:
        - ssh
        - dhcpv6-client

include:
  - firewall.{{ grains['id'] }}
