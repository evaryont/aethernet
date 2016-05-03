Install common packages:
  pkg.latest:
    - pkgs: {{ pillar['common_packages']['happy_admin'] + pillar['common_packages']['salt_dependencies'] + pillar['common_packages']['sys_utils'] }}
