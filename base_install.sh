#!/bin/sh

hostnameMatches() {
  hostname | grep $1 > /dev/null
  return $?
}

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

enableService salt-minion
if hostnameMatches master; then
  enableService salt-master
fi

cat >/etc/salt/minion <<EOF
# vagrant script base_install.sh put this here
master: 10.20.30.11
EOF
