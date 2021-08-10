#!/bin/bash

# Stops and removes the container:
docker stop wiki_music
docker rm wiki_music

# Removes the DokuWiki image:
docker rmi linuxserver/dokuwiki:latest

# Pulls the latest DokuWiki image:
docker pull linuxserver/dokuwiki:latest

# Changes to the "music" directory and starts the container:
cd /Users/hank/Docker/wikis/music/
docker run -d --restart=unless-stopped --name=wiki_music -p 8003:80 --mount type=bind,source="$(pwd)"/data,target=/config/dokuwiki/data/ linuxserver/dokuwiki:latest
