#!/bin/sh

name="${1}"
formula_name="${name}-formula"

if [ -z "${name}" ]; then
  echo "Tell me what formula you want to add"
  exit 2
fi

echo "Adding the ${name} formula as a submodule"

set -xeuo pipefail

git submodule add https://github.com/saltstack-formulas/${formula_name} formulas/${formula_name}
sed -i '/\}\}\/salt/a\        - {{ basedir }}/formulas/'${formula_name} pillar/salt.sls
git add pillar/salt.sls
git commit -m "Add the ${name} formula"
