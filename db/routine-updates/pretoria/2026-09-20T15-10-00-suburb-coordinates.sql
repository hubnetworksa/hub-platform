-- Suburb map coordinates from OpenStreetMap (Nominatim), © OpenStreetMap contributors. Only fills suburbs that have none.
UPDATE suburbs SET lat = -25.802692, lng = 28.338076 WHERE slug = 'boardwalk-meander' AND lat IS NULL;
UPDATE suburbs SET lat = -25.779659, lng = 28.469334 WHERE slug = 'donkerhoek' AND lat IS NULL;
