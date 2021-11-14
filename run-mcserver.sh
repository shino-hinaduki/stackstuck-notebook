#!/bin/bash
docker run \
    -e EULA=TRUE \
    -e ONLINE_MODE=TRUE \
    -e DIFFICULTY=peaceful \
    -p 25565:25565 itzg/minecraft-server