-- Suburb map coordinates from OpenStreetMap (Nominatim), © OpenStreetMap contributors. Only fills suburbs that have none.
UPDATE suburbs SET lat = -23.8875, lng = 29.451944 WHERE slug = 'industria' AND lat IS NULL;
