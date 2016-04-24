# Dynamic version of admin_names as pillar data to expose to salt states
{% import_yaml 'admin_names.yaml' as admin_vars %}

admin_stuff:
  foo: "bar"

administrivia:
{% for var in admin_vars %}
  {{ var }}: {{ admin_vars[var] }}
{% endfor %}
