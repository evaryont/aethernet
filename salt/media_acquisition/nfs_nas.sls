music dir:
  mount.mounted:
    - name: /home/frog/media/music
    - device: "symbol.aether.nu:/volume1/music"
    - fstype: nfs
    - opts: "auto,x-systemd.automount,users"
    - dump: 0
    - pass_num: 0
    - persist: True
    - mount: True
    - user: frogger

photos dir:
  mount.mounted:
    - name: /home/frog/media/pictures
    - device: "symbol.aether.nu:/volume1/pictures"
    - fstype: nfs
    - opts: "auto,x-systemd.automount,users"
    - dump: 0
    - pass_num: 0
    - persist: True
    - mount: True
    - user: frogger

videos dir:
  mount.mounted:
    - name: /home/frog/media/videos
    - device: "symbol.aether.nu:/volume1/videos"
    - fstype: nfs
    - opts: "auto,x-systemd.automount,users"
    - dump: 0
    - pass_num: 0
    - persist: True
    - mount: True
    - user: frogger
