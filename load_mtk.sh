#!/bin/bash

wget http://kartat.kapsi.fi/files/maastotietokanta/kaikki/etrs89/gml/${1:0:2}/${1:0:3}/$1_mtk.zip
unzip $1_mtk.zip
ogr2ogr -append -f "PostgreSQL" PG:"host=localhost user=osm password=osm dbname=osm" $1.xml
