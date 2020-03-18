[back to main page](https://github.com/kwantu/platformconfiguration/wiki)

## Docker configuration on Couchp02

In the `/opt/openmaptiles` folder, the installation for the open map tiles builder has been installed. It requires a docker installation to run.

1. First make sure that there is no docker instances running:

```bash
ps -ef | grep docker
docker container stop 24b5c9f32a8c11809c1d9736f2ea6c93a2b2b2ec7f186d5877004ebfb877c132
where 24b5c9f32a8c11809c1d9736f2ea6c93a2b2b2ec7f186d5877004ebfb877c132 is the docker instance
```
2. Then go to the openmaptiles installation to configure the map that you want to prepare. To do this clone the OpenMapTiles repo. See the QUICKSTART.md file for detailed instructions


```bash
git clone https://github.com/openmaptiles/openmaptiles.git
cd ./openmaptiles

cat QUICKSTART.md

## make sure that the docker service is running
service docker start
```
3. Update the defaults: update the bounding box area and centrepoint as well as the zoom levels in 

```bash
vim openmaptiles.yaml

...
  center: [ 13.37119,52.50915, 4]
  bounds: [13.32407,52.47961,13.41882,52.54072]
  maxzoom: 19
  minzoom: 0
...

```

4. Set the environment values as well in .env

```bash
vim .env

...
POSTGRES_DB=openmaptiles
POSTGRES_USER=openmaptiles
POSTGRES_PASSWORD=openmaptiles
POSTGRES_HOST=postgres
POSTGRES_PORT=5432
QUICKSTART_MIN_ZOOM=0
QUICKSTART_MAX_ZOOM=14
DIFF_MODE=false

BBOX=13.32407,52.47961,13.41882,52.54072
MIN_ZOOM=0
MAX_ZOOM=14
```
5. Download the source osm.pbf files from the geofrabric site. Note that the areas are defined in the 

https://golb.hplar.ch/2018/07/self-hosted-tile-server.html is a link with some notes how to go
https://openmaptiles.com/server/
https://openmaptiles.org/docs/
https://openmaptiles.org/docs/generate/generate-openmaptiles/

```bash
cd /opt/openmaptiles/
cd data


  843  make start-tileserver
  844  docker container stop
  845  docker container stop41cc3f2729f9063b35814fa4f951f150d81a605c6c1d83579ad2cd4fe2231713
  846  docker container stop 41cc3f2729f9063b35814fa4f951f150d81a605c6c1d83579ad2cd4fe2231713
  847  make start-tileserver
  848  ll
  849  mkdir kwantu-maps
  850  cd data
  851  ll
  852  mv cape-town-cdb-tiles.mbtiles ../kwantu-maps/.
  853  ll
  854  cd ..
  855  make start-tileserver
  856  ps -ef | grep docker
  857  docker container stop 24b5c9f32a8c11809c1d9736f2ea6c93a2b2b2ec7f186d5877004ebfb877c132
  858  ps -ef | grep docker
  859  make start-tileserver south-africa
  860  ll
  861  vim openmaptiles.yaml
  862  history
  863  ./quickstart.sh 
  864  ./quickstart.sh cpt
  865  ./quickstart.sh cape-town
  866  ./quickstart.sh south-africa
  867  ll
  868  vim docker-compose.yml
  869  cd data
  870  ll
```

6. Export the tiles to the file system
https://github.com/mapbox/mbutil

# Utilities to calculate the tile numbers, or the bounding box
http://tools.geofabrik.de/calc/#type=geofabrik_standard&bbox=13.32,52.47,13.42,52.55

# Dealing with the issue of zoom levels
## Methodology for the planet osm2vectortiles/osm2vectortiles
https://github.com/osm2vectortiles/osm2vectortiles/blob/master/USAGE.md<br>
Note that this has now been withdrawn due to copyright issues

## Use Tippecanoe
https://github.com/mapbox/tippecanoe <br>


## Other references relating to overzoom and zoom levels
 1. [Adjust the zoom extent of your tileset](https://docs.mapbox.com/help/troubleshooting/adjust-tileset-zoom-extent/)
 2. [How does overzooming work?](https://github.com/mapbox/vector-tiles/issues/21#issuecomment-240169793)
 3. [Tilemap Zoom Extent #490](https://github.com/mapbox/mapbox-unity-sdk/issues/490)
