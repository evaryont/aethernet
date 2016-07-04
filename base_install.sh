#!/bin/sh

if [ -f /etc/arch-release ]; then
  OS='arch'
elif [ -f /etc/centos-release ]; then
  OS='centos'
fi

# simple check if the machine's hostname matches the first argument
hostnameMatches() {
  hostname | grep $1 > /dev/null
  return $?
}

# Enable a service in systemd
enableService() {
  shortName=$(basename $1)

  echo -n "Enabling ${shortName}... "
  systemctl enable $1

  systemctl reload-or-restart ${shortName}
}

update_and_install() {
  if [ "$OS" == 'arch' ]; then
    echo "Performing system upgrade"
    pacman -Syu --quiet --noconfirm

    echo "Installing salt on Arch"
    pacman -S --quiet --noconfirm --needed salt-zmq 
  elif [ "$OS" == 'centos' ]; then
    echo "Updating system"
    yum makecache fast --assumeyes --quiet
    yum install --assumeyes --quiet epel-release
    yum update --assumeyes --quiet
    echo "Installing salt on CentOS"
    yum install --assumeyes --quiet https://repo.saltstack.com/yum/redhat/latest/x86_64/salt-repo-2015.8-2.el7.noarch.rpm
    yum install --assumeyes --quiet salt-minion
  fi
}

# Make sure the system is up-to-date and install salt on top of that
update_and_install

# Check if we're the salt master, and do some basic configuration
if hostnameMatches master; then
  cat >/etc/salt/master <<EOF
pillar_roots:
  base:
    - /srv/pillar

auto_accept: True
hash_type: sha256
pillar_merge_lists: True

file_roots:
  base:
    - /srv/salt
EOF

  for formula_dir in /srv/formulas/*; do
    echo "    - ${formula_dir}" >> /etc/salt/master
  done

  enableService salt-master
fi

# Do some more basic configuration for the salt minion for everyone
cat >/etc/salt/minion <<EOF
# vagrant script base_install.sh put this here
master: 10.20.30.11
hash_type: sha256
EOF

enableService salt-minion

sleep 2
salt-call state.highstate
