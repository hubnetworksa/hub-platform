UPDATE businesses
SET description = 'Ice Cape Town is a factory shop and wholesale supplier of packaged ice, craft ice and dry ice, established in 2007, also stocking gel ice packs, Buddy Cool cooler boxes and La Vie water, in Paarden Eiland.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 07:00-15:00, Tue-Fri 07:00-16:00, Sat 07:00-12:00, Sun 07:00-08:00'
WHERE slug = 'ice-cape-town-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Instruments South Africa is a manufacturer and supplier of SABS-approved pressure and temperature equipment, valves, recorders, controllers, transmitters and related process-control instruments, including products from Honeywell and Jumo, based in Paarden Eiland.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://isafrica.za.net/valves/", "https://www.yellosa.co.za/company/948174/instruments-south-africaptyltd", "https://www.engnetglobal.com/c/f.aspx/INS024"]'
WHERE slug = 'instruments-south-africa-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Designer Warehouse Emporium is a factory-shop clothing and accessories store for babies, boys, girls, ladies and gents, trading since 2008, on Voortrekker Road in Maitland.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 09:00-12:30, 14:00-17:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/the-designer-warehouse-emporium-68809", "https://www.findglocal.com/ZA/Cape-Town/492443357591597/The-Designer-Warehouse-Emporium", "https://evendo.com/locations/south-africa/western-cape/shop/the-designer-warehouse-emporium-tdwemporium"]'
WHERE slug = 'the-designer-warehouse-emporium-maitland' AND description_enriched_at IS NULL;
