UPDATE businesses
SET description = 'Goseame Wholesalers is a wholesale and retail fresh produce market in Ladine, selling fruit, vegetables, meat, flowers and groceries at bulk-buy prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/limpopo/goseame-wholesalers-17540", "https://za.africabz.com/limpopo/goseame-wholesalers-46266", "https://www.shopshours.co.za/goseame-wholesalers/polokwane/c-57f3c9f347d677c3b27a5b54", "https://bestfoodimporters.com/company/goseame-fresh-produce-open-market/", "https://www.brabys.com/za/limpopo/polokwane/fruits-vegetables/goseame-wholesalers"]'
WHERE slug = 'goseame-wholesalers-ladine' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Midas Landdros Mare is a branch of the Midas automotive chain in Polokwane Central, stocking spare parts, car-care products, tools and accessories, and offering panel and workshop services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://midas.co.za/store-locator/landros-mare-midas/", "https://dir.alltrack.org/view/277319-5-midas,-landdros-mar%C3%A9-street", "https://hombaze.co.za/landros-mare-midas-16661804550994174918/", "https://za.africabz.com/limpopo/midas-41049"]'
WHERE slug = 'midas-landdros-mare-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BCM Didgisol is an authorised Ricoh Platinum Business Partner based in Polokwane''s N1 Industrial Park, supplying and supporting office automation equipment and solutions across Limpopo since 2002.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.findglocal.com/ZA/Polokwane/212439435578016/BCM-Didgisol---Ricoh-Platinum-Business-Partner", "https://www.facebook.com/BCMDidgisol/", "https://ricohlimpopo.co.za/contact-us/", "https://za.linkedin.com/company/bcm-didgisol---ricoh-platinum-business-partner"]'
WHERE slug = 'ricoh-bcm-didgisol-ext91-industrial' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPCA Polokwane is a non-profit animal welfare organisation in Roodepoort offering animal adoption with home inspections, pet boarding, and veterinary services including sterilisation, vaccination and microchipping.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/spca-polokwane-polokwane", "https://www.yellosa.co.za/company/740591/s-p-c-a-polokwane", "https://polokwane.co/spca-polokwane-page/", "https://spcapolokwane.wixsite.com/info"]'
WHERE slug = 'spca-polokwane-roodepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Steakshop is a family-run butchery in Welgelegen known for quality braai meat and deli products, trading for more than a decade (previously as Vleislapa Welgelegen), with home delivery available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.steakshop.co.za/", "https://za.africabz.com/limpopo/vleislapa-welgelegen-48489", "https://m.facebook.com/TheSteakshopZA/photos/see-you-today-our-address-95-general-viljoen-street-polokwane-welgelegen-httpsma/1397722161180955/", "https://www.cylex.net.za/company/the-steakshop-23779827.html"]'
WHERE slug = 'the-steakshop-welgelegen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UFO Game Centre is a furniture showroom inside the Game Centre mall in Polokwane, part of the United Furniture Outlets chain established in 2004, offering lounge, dining and bedroom suites along with headboards and home accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.unitedfurnitureoutlets.co.za/storelocator/store/index/id/101/", "https://visita.co.za/directory/ufo-polokwane-game-centre/", "https://www.unitedfurnitureoutlets.co.za/stores/polokwane-game-centre/"]'
WHERE slug = 'ufo-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UFO Savannah Mall is a United Furniture Outlets showroom inside Savannah Mall in Fauna Park, offering couches, dining and lounge suites, beds, mattresses and home accessories from the furniture chain established in 2004.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.unitedfurnitureoutlets.co.za/storelocator/store/index/id/100/", "https://hombaze.co.za/ufo-polokwane-14851157183350663359/", "https://www.facebook.com/UnitedFurnitureOutlets/photos/visit-our-polokwane-stores-and-experience-the-epitome-of-luxury-and-comfort-with/1137700581734494/"]'
WHERE slug = 'ufo-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westvaal Polokwane is a multi-franchise motor dealership on the corner of the R101 and Marshall Street, representing Opel, Citroen, Peugeot and Isuzu from a large complex that also houses an Isuzu Truck Centre and a used-vehicle dealership.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cars.co.za/groups/Westvaal/Westvaal-Polokwane/3611/", "https://www.yellosa.co.za/company/615519/opelisuzu-dealer-westvaal-polokwane", "https://www.westvaal.co.za/contact-us/westvaal-polokwane/", "https://dealerfloor.co.za/dealer-news/westvaal-goes-big-in-polokwane-with-new-complex"]'
WHERE slug = 'westvaal-polokwane-nirvana' AND description_enriched_at IS NULL;
