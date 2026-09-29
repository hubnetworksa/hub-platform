UPDATE businesses
SET description = 'Hypermed Pharmacy is an Alpha Pharm-affiliated retail pharmacy on the corner of York and Main Road in Green Point, offering a dispensary along with general health, wellness and beauty products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-19:00, Sun 09:00-19:00',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/green-point/pharmacies/hypermed-pharmacy", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88430", "https://www.facebook.com/AlphaPharmHypermedPharmacy/"]'
WHERE slug = 'hypermed-pharmacy-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jarryds is a Parisian-inspired all-day brunch bistro and vinyl lounge on Regent Road in Sea Point, serving breakfast, salads, burgers and bagels throughout the day.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:30-16:00',
    source_urls = '["https://www.instagram.com/jarryds_eatery/reel/C9y92ixKLzO/", "https://www.corner.inc/place/67708", "https://www.eatout.co.za/venue/jarryds-brunch-bistro/"]'
WHERE slug = 'jarryds-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lifestyle Emporium is a hair and beauty salon on the corner of Surrey Place and Bay Road in Mouille Point.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 09:00-17:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1904949", "https://za.africabz.com/western-cape/lifestyle-emporium-177790", "https://lifestyleemporium.co.za/"]'
WHERE slug = 'lifestyle-emporium-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAH Green Point is a veterinary hospital on High Level Road offering routine and emergency animal care, including vaccinations, dental care, surgery, radiology and round-the-clock emergency treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:30, Sat 08:00-12:30, Sun Closed',
    source_urls = '["https://tah.co.za/green-point/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=197021", "https://veterinary.co.za/find-a-vet/tah-green-point/"]'
WHERE slug = 'tah-green-point-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Greek Fisherman is a seafood restaurant on Regent Road in Sea Point known for its Greek-influenced menu, set menus and Seafood Saturday specials.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/GreekFishermanSA/videos/-78-regent-rd-sea-point%EF%B8%8F-021-418-5411-infogreekfishermancoza-thegreekfisherman-g/987786610065040/", "https://za.africabz.com/western-cape/greek-fisherman-19617", "https://greekfisherman.co.za/contact/"]'
WHERE slug = 'greek-fisherman-sea-point' AND description_enriched_at IS NULL;
