Install postgis & hstore extensions.

Import osm data using imposm3.

```bash
wget http://download.geofabrik.de/europe/finland-latest.osm.pbf
imposm3 import -config config.json -read finland-latest.osm.pbf -write -diff -overwritecache
imposm3 import -config config.json -deployproduction
```

Load mtk data. Note that there are several files to import.
```
wget http://kartat.kapsi.fi/files/maastotietokanta/kaikki/etrs89/gml/M4/M43/M4313L_mtk.zip
unzip M4313L_mtk.zip
ogr2ogr -append -f "PostgreSQL" PG:"host=localhost user=osm password=osm dbname=osm" M4313L.xml
```
