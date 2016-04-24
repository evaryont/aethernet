Ensure every dynamic module is updated:
  schedule.present:
    - function: saltutil.sync_all
    - seconds: 28800 # Every 8 hours
    - splay: 600 # Randomly delay across an hour
    - maxrunning: 1

Run highstate occasionally:
  schedule.present:
    - function: state.highstate
    - seconds: 39600 # Every 11 hours
    - splay: 600 # Randomly delay across an hour
    - maxrunning: 1

Delete my default minion configuration:
  file.absent:
    - name: /etc/salt/minion

Delete my default master configuration:
  file.absent:
    - name: /etc/salt/master

salt-services:
  augeas.change:
    - lens: services
    - context: /files/etc/services
    - changes:
      - ins service-name after service-name[last()]
      - set service-name[last()] salt-master-publish
      - set service-name[. = 'salt-master-publish']/#comment "Minions connect and listen for commands"
      - set service-name[. = 'salt-master-publish']/port 4505
      - set service-name[. = 'salt-master-publish']/protocol tcp
      - ins service-name after service-name[last()]
      - set service-name[last()] salt-master-comms
      - set service-name[. = 'salt-master-comms']/#comment "Bi-directional communication between master and minions"
      - set service-name[. = 'salt-master-comms']/port 4506
      - set service-name[. = 'salt-master-comms']/protocol tcp
    - unless: grep "salt-master-publish" /etc/services
