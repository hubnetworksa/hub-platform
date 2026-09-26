-- Batch add, user request (2026-09-26): Goseame Wholesalers, Midas, SPCA,
-- Steakshop, UFO, Ricoh, Westvaal. Trading hours flagged as important by
-- the user, so hours included wherever a source explicitly stated them
-- (left NULL where not found, never guessed).
--
-- UFO (United Furniture Outlets) turned out to have two distinct verified
-- Polokwane branches (Savannah Mall and Game Centre) rather than one --
-- both added, since both are real, separately-addressed locations.
--
-- Midas: Polokwane appears to have more than one Midas franchise (a
-- "Mega Polokwane Midas" and a "LIMPOPO MIDAS" @ Grobler St also turned
-- up in research) but only the Landdros Mare branch had clean,
-- multi-source-agreeing address+phone+hours, so only that one is added
-- here -- named to disambiguate, per scripts/disambiguate-chain-branches.mjs's
-- convention. The others can be added in a future pass if verified.
--
-- Each business: 2+ independent sources agreeing on name + address (phone
-- mandatory too, per ROUTINE.polokwane.md), listed in its own
-- source_urls. Direct fetch of every one of these domains is blocked by
-- this sandbox's egress proxy, so all are via the documented WebSearch
-- fallback -- explicit, literal snippet content, never inferred.

-- 1. Goseame Wholesalers (fresh produce wholesale market) -- agreed by
-- southafricafirm.com, brabys.com, africabz.com, polomap.com (all
-- independent directories, same address+phone). Hours per
-- shopshours.co.za; one other source suggested different hours, so this
-- is the version corroborated by the source that also had the address on
-- the same page.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'goseame-wholesalers-ladine', 'Goseame Wholesalers',
  (SELECT id FROM suburbs WHERE slug = 'ladine'),
  '23 Silicon St, Polokwane Ext 17, Polokwane, 0699', '015 297 4879', 'https://www.goseame.co.za', NULL,
  'Goseame Wholesalers is a fresh produce wholesale market on Silicon Street in Polokwane, selling fruit and vegetables in bulk.',
  NULL, NULL,
  '["https://southafricafirm.com/limpopo/goseame-wholesalers-17540", "https://za.africabz.com/limpopo/goseame-wholesalers-46266", "https://www.shopshours.co.za/goseame-wholesalers/polokwane/c-57f3c9f347d677c3b27a5b54"]',
  'published', 'agent_research', 'Mon-Sat 10:00-20:00, Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'goseame-wholesalers-ladine'),
        (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

-- 2. Midas (Landdros Mare branch) -- agreed by midas.co.za's own store
-- locator ("Landros Mare Midas") plus independent directories
-- dir.alltrack.org, hombaze.co.za, za.africabz.com, all on the same
-- address+phone+hours.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'midas-landdros-mare-polokwane-central', 'Midas (Landdros Mare)',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '90 Landdros Mare St, Polokwane Central, 0700', '015 297 8348', 'https://midas.co.za/store-locator/landros-mare-midas/', NULL,
  'Midas Landdros Mare is a vehicle parts and accessories store on Landdros Mare Street in Polokwane Central, part of the national Midas auto parts chain.',
  NULL, NULL,
  '["https://midas.co.za/store-locator/landros-mare-midas/", "https://dir.alltrack.org/view/277319-5-midas,-landdros-mar%C3%A9-street", "https://hombaze.co.za/landros-mare-midas-16661804550994174918/"]',
  'published', 'agent_research', 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun 09:00-13:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'midas-landdros-mare-polokwane-central'),
        (SELECT id FROM categories WHERE slug = 'motor-spares'), 1);

-- 3. SPCA Polokwane -- agreed by thinklocal.co.za, yellosa.co.za and
-- polokwane.co, all stating the same Lansdale/Roodepoort address and
-- 015 291 1088 number. Hours per thinklocal.co.za.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'spca-polokwane-roodepoort', 'SPCA Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'roodepoort-polokwane'),
  '46 Lansdale, Roodepoort, Polokwane, 0700', '015 291 1088', NULL, 'spcaplk@telkomsa.net',
  'SPCA Polokwane is the local branch of the Society for the Prevention of Cruelty to Animals, providing animal welfare, shelter and veterinary outreach services.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/spca-polokwane-polokwane", "https://www.yellosa.co.za/company/740591/s-p-c-a-polokwane", "https://polokwane.co/spca-polokwane-page/"]',
  'published', 'agent_research', 'Mon-Fri 08:30-17:45, Sat 09:00-15:00, Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'spca-polokwane-roodepoort'),
        (SELECT id FROM categories WHERE slug = 'vets-animal-care'), 1);

-- 4. The Steakshop (butchery) -- agreed by its own site (steakshop.co.za)
-- and an independent Facebook post literally stating the same address
-- ("95 general viljoen street, polokwane, welgelegen"), plus
-- za.africabz.com on the same address+phone. No explicit trading hours
-- found in any source -- left NULL rather than guessed.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-steakshop-welgelegen', 'The Steakshop',
  (SELECT id FROM suburbs WHERE slug = 'welgelegen'),
  '95 Gen Viljoen St, Welgelegen, Polokwane Ext 1, Polokwane, 0699', '015 297 0874', 'https://www.steakshop.co.za/', NULL,
  'The Steakshop is a butchery on General Viljoen Street in Welgelegen, Polokwane, selling fresh meat and steak cuts.',
  NULL, NULL,
  '["https://www.steakshop.co.za/", "https://za.africabz.com/limpopo/vleislapa-welgelegen-48489", "https://m.facebook.com/TheSteakshopZA/photos/see-you-today-our-address-95-general-viljoen-street-polokwane-welgelegen-httpsma/1397722161180955/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-steakshop-welgelegen'),
        (SELECT id FROM categories WHERE slug = 'butcheries'), 1);

-- 5. UFO (United Furniture Outlets) -- Savannah Mall branch. Agreed by
-- UFO's own store locator and the mall's own listing; hours per
-- openhours-southafrica.com (UFO trading hours), consistent with
-- Savannah Mall's own published hours for weekdays.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'ufo-savannah-mall-fauna-park', 'UFO Savannah Mall',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'savannah-mall-fauna-park'),
  'Shop G33, Savannah Mall, Thabo Mbeki St, Fauna Park, Polokwane, 0699', '015 023 0707', 'https://www.unitedfurnitureoutlets.co.za/storelocator/store/index/id/100/', NULL,
  'UFO (United Furniture Outlets) at Savannah Mall sells furniture, bedding and homeware on credit and cash terms.',
  NULL, NULL,
  '["https://www.unitedfurnitureoutlets.co.za/storelocator/store/index/id/100/", "https://hombaze.co.za/ufo-polokwane-14851157183350663359/"]',
  'published', 'agent_research', 'Mon-Fri 09:00-18:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ufo-savannah-mall-fauna-park'),
        (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

-- 6. UFO (United Furniture Outlets) -- Game Centre branch. Agreed by
-- UFO's own store locator and visita.co.za directory, same address+phone.
-- Hours per UFO's own store locator page.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'ufo-game-centre-polokwane-central', 'UFO Game Centre',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'game-centre-polokwane-central'),
  'Shop 0018B, Game Centre, Cnr Hospital & Market St, Polokwane, 0699', '015 023 0708', 'https://www.unitedfurnitureoutlets.co.za/storelocator/store/index/id/101/', NULL,
  'UFO (United Furniture Outlets) at Game Centre sells furniture, bedding and homeware on credit and cash terms.',
  NULL, NULL,
  '["https://www.unitedfurnitureoutlets.co.za/storelocator/store/index/id/101/", "https://visita.co.za/directory/ufo-polokwane-game-centre/"]',
  'published', 'agent_research', 'Mon-Fri 08:30-17:30, Sat 09:00-16:00, Sun 09:00-14:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ufo-game-centre-polokwane-central'),
        (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

-- 7. Ricoh (BCM Didgisol -- the Ricoh Platinum Business Partner covering
-- Limpopo; Ricoh itself sells only through partners, no owned branches).
-- Agreed by Facebook, LinkedIn, findglocal.com and Waze, all independent,
-- same address+phone. Suburb: new "Polokwane Ext 91 Industrial" (see
-- migration 0041) -- a distinct municipal industrial zone, not the same
-- precinct as Magna Via Industrial or Industria. Hours per multiple
-- catalogue/directory pages; no Saturday hours found in any source, so
-- left as Mon-Fri only rather than guessed.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'ricoh-bcm-didgisol-ext91-industrial', 'Ricoh (BCM Didgisol)',
  (SELECT id FROM suburbs WHERE slug = 'ext91-industrial'),
  'No 1 Michelle Crescent, N1 Industrial Park, Polokwane Ext 91, Polokwane, 0699', '015 297 5295', 'https://ricohlimpopo.co.za/', 'sales@ricohlimpopo.co.za',
  'BCM Didgisol is Ricoh''s Platinum Business Partner for Limpopo, supplying and servicing Ricoh photocopiers, printers and managed document services.',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Polokwane/212439435578016/BCM-Didgisol---Ricoh-Platinum-Business-Partner", "https://www.facebook.com/BCMDidgisol/", "https://ricohlimpopo.co.za/contact-us/"]',
  'published', 'agent_research', 'Mon-Thu 08:00-17:00, Fri 08:00-16:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ricoh-bcm-didgisol-ext91-industrial'),
        (SELECT id FROM categories WHERE slug = 'computer-it-services'), 1);

-- 8. Westvaal Polokwane (multi-brand dealer group: Opel, Isuzu, Citroën,
-- Fiat, Jeep, MG). Address agreed by westvaal.co.za (official) and
-- cars.co.za (independent). Phone 015 297 1149 confirmed independently
-- by yellosa.co.za on the same address -- used in preference to a
-- 015 001 0633 number that only appeared on westvaal.co.za itself.
-- Hours per westvaal.co.za.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'westvaal-polokwane-nirvana', 'Westvaal Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  'Cnr R101 & Marshall Street, Polokwane, 0699', '015 297 1149', 'https://www.westvaal.co.za/polokwane/', NULL,
  'Westvaal Polokwane is a multi-brand motor dealership at the corner of the R101 and Marshall Street, selling and servicing Opel, Isuzu, Citroen, Fiat, Jeep and MG vehicles.',
  NULL, NULL,
  '["https://www.cars.co.za/groups/Westvaal/Westvaal-Polokwane/3611/", "https://www.yellosa.co.za/company/615519/opelisuzu-dealer-westvaal-polokwane", "https://www.westvaal.co.za/contact-us/westvaal-polokwane/"]',
  'published', 'agent_research', 'Mon-Fri 07:30-17:00, Sat 08:00-12:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'westvaal-polokwane-nirvana'),
        (SELECT id FROM categories WHERE slug = 'car-dealerships'), 1);
