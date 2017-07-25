#!/bin/bash

if [ ! -f /data/minecraft_server.jar ]
then
    curl "https://s3.amazonaws.com/Minecraft.Download/versions/1.11.2/minecraft_server.1.11.2.jar" -o /data/minecraft_server.jar
fi

if [ ! -f /data/eula.txt ]
then
    echo "eula=true" > /data/eula.txt
fi

cd ../data; java -Xmx2G -jar minecraft_server.jar nogui
