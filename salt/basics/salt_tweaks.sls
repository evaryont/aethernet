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
