#!/bin/sh

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

  echo -n "Reloading ${shortName}... "
  if [ "$2" == "block" ]; then
    systemctl reload-or-restart ${shortName}
  else
    systemctl --no-block reload-or-restart ${shortName}
  fi
}

echo "Performing system upgrade"
pacman -Syu --noconfirm

echo "Installing salt on Arch"
pacman -S salt-zmq --noconfirm

# Check if we're the salt master, and do some basic configuration
if hostnameMatches master; then
  cat >/etc/salt/master <<EOF
file_roots:
  base:
    - /srv/salt

pillar_roots:
  base:
    - /srv/pillar

auto_accept: True
hash_type: sha256
EOF

  enableService salt-master
fi

# Do some more basic configuration for the salt minion for everyone
cat >/etc/salt/minion <<EOF
# vagrant script base_install.sh put this here
master: 10.20.30.11
hash_type: sha256
EOF

enableService salt-minion
