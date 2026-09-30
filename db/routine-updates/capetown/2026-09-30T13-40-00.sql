UPDATE businesses
SET description = 'Cash Crusaders Eerste River is a second-hand goods and pawnbroking store in the Maxi Centre, Eerste River, buying and selling used electronics, tools, and other pre-owned items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://cashcrusaders.co.za/locate-a-store/store/110/Cash%20Crusaders%20Eerste%20Rivier", "https://www.yellosa.co.za/company/460072/cash-crusaders-eerste-river", "https://www.tiendeo.co.za/stores/eerste-river/cash-crusaders-shop-no-maxi-centre-plein-street/22154"]'
WHERE slug = 'cash-crusaders-eerste-river-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hungry Lion Eerste River is an outlet of the fast-food takeaway chain, serving fried chicken and other quick meals in Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'hungry-lion-eerste-river-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lavish Nails by Tia is a nail salon in Ruyterwacht offering nail treatments alongside facials, skincare, and makeup services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:00'
WHERE slug = 'lavish-nails-by-tia-ruyterwacht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Liquor City Eerste River is a liquor store in the Maxi Centre, Eerste River, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 11:00-18:00'
WHERE slug = 'liquor-city-eerste-river-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP HOME Grand Central is a homeware and furniture retailer in the Grand Central Shopping Centre, Eerste River, selling household goods, furniture, and décor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:00-17:30, Wed 09:30-17:30, Thu 09:00-17:30, Fri 09:00-18:00, Sat 08:00-15:00, Sun 09:00-15:00'
WHERE slug = 'pep-home-grand-central-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Eerste Rivier Service Centre is a bank branch in Eerste River, Cape Town, offering everyday banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:30, Sat 08:30-11:00, Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/516597/standard-bankeerste-rivier-service-centre-", "https://www.cylex.net.za/company/standard-bank-17706441.html", "https://openhours-southafrica.com/en/city-of-cape-town/standard-bank-eerste-rivier-service-centre"]'
WHERE slug = 'standard-bank-eerste-rivier-service-centre-eerste-river' AND description_enriched_at IS NULL;
