select t.nimi_suomi, w.osm_id
  from tieviiva t
  left join osm_roads w on st_intersects(st_transform(t.wkb_geometry, 3857), w.geometry)
  where w.name = '' and nimi_suomi != ''
  and (w.type = 'unclassified' or w.type = 'residential')
  and GeometryType(st_intersection(st_transform(t.wkb_geometry, 3857), w.geometry)) != 'POINT';
  
