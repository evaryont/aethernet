Install packages to make the admin happy:
  pkg.latest:
    - pkgs: {{ pillar['common_packages']['happy_admin'] }}

Install packages for salt and it's modules:
  pkg.latest:
    - pkgs: {{ pillar['common_packages']['salt_dependencies'] }}

Install system utilities packages:
  pkg.latest:
    - pkgs: {{ pillar['common_packages']['sys_utils'] }}
