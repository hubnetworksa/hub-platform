UPDATE businesses
SET description = 'Ya-Rena Construction is a civil engineering and structural concrete construction company established in 1995, specialising in reservoirs, bridges, dams and related infrastructure projects across Limpopo and North West province, and holds a level 3 BBBEE rating.',
    description_enriched_at = datetime('now')
WHERE slug = 'ya-rena-construction-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tile Africa Polokwane is a branch of the national Tile Africa chain, stocking a wide range of local and imported floor and wall tiles, porcelain and natural stone, along with bathroom fittings and accessories for home and commercial projects.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/polokwane/tile-africa-cnr-nikkel-nelson-mandela-drive-superbia-polokwane/23089", "https://vymaps.com/ZA/Tile-Africa-Polokwane-518611448339148/", "https://www.tileafrica.co.za/find-a-store"]'
WHERE slug = 'tile-africa-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Carpet & Decor Centre is a flooring specialist supplying and installing carpets, carpet tiles, vinyl, laminate and bamboo flooring as well as blinds and wallpaper, for home and commercial customers.',
    description_enriched_at = datetime('now')
WHERE slug = 'carpet-decor-centre-superbia' AND description_enriched_at IS NULL;
