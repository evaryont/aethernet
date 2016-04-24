Ensure every dynamic module is updated:
  module.run:
    - name: saltutil.sync_all
    - refresh: True
