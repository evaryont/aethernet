docker-containers:
  lookup:
    couchpotato:
      image: "linuxserver/couchpotato"
      cmd:
      runoptions:
        - "--name=couchpotato"
        - "-v /etc/localtime:/etc/localtime:ro"
        - "-v /etc/mediaapps/couchpotato:/config"
        - "-v /srv/couchpotato/downloads:/downloads"
        - "-v /srv/couchpotato/movies:/movies"
        - "-e PGID=5501" # these IDs match that from the salt formula
        - "-e PUID=5501"
        - "-p 5050:5050"
    sonarr:
      image: "linuxserver/sonarr"
      cmd:
      runoptions:
        - "--name=sonarr"
        - "-v /dev/rtc:/dev/rtc:ro"
        - "-v /etc/mediaapps/sonarr:/config"
        - "-v /srv/sonarr/downloads:/downloads"
        - "-v /srv/sonarr/tv:/tv"
        - "-e PGID=5502" # these IDs match that from the salt formula
        - "-e PUID=5502"
        - "-p 8989:8989"

docker-pkg:
  lookup:
    config:
      - "# see pillar/media_acquisition for these"
