-- thin-pages pretoria batch 10, checkpoint 4: Bronberrik (2 businesses, none close
-- a combo to 3 -- general-retail and schools-education both still 1 short)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'bronberrik-pharmacy-bronberrik', 'Bronberrik Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'bronberrik'),
  '400 Theuns Van Niekerk Street, Wierda Park, Centurion, 0157', '012 653 4191', NULL, 'info@bronberrikapteek.co.za',
  'Bronberrik Pharmacy is a community pharmacy trading under the Local Choice banner in Wierda Park, Centurion, on the southern edge of Bronberrik. It offers dispensing and over-the-counter medicine, together with clinic services and support for customers using medical aid, making it a point of call for everyday health needs in the surrounding neighbourhood.

The pharmacy also offers a delivery service for customers who cannot collect their medication in person, a service several local directories highlight for Wierda Park residents. It keeps extended hours across the week, opening into the evening on weekdays and Saturdays, with shorter Sunday hours split between a morning and early-evening slot, making it accessible outside typical working hours for people living in and around Bronberrik.',
  'Mon-Fri 08:00-20:00, Sat 08:00-19:00, Sun 10:00-13:00',
  '["https://firmania.co.za/centurion/bronberrik-pharmacy-99039", "https://www.cylex.net.za/company/bronberrik-pharmacy-23664022.html", "https://healthandmedical.co.za/view/bronberrik-pharmacy", "https://pharmasa.co.za/store-locator/the-local-choice-bronberrik-pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bronberrik-pharmacy-bronberrik'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'zwartkop-christian-school-bronberrik', 'Zwartkop Christian School',
  (SELECT id FROM suburbs WHERE slug = 'bronberrik'),
  '142 Pine Avenue, Bronberrik, Centurion, 0157', '012 654 0579', 'https://www.zwartkopcs.co.za', NULL,
  'Zwartkop Christian School is an independent Christian school in Bronberrik, Centurion, offering education from the pre-primary and toddler phase through to Grade 12. Keeping pupils on one campus across pre-primary, primary and high-school phases lets families avoid changing schools as children progress, and the school structures its curriculum and activities around a Christian ethos throughout every phase.

The school operates from Pine Avenue in Bronberrik and keeps weekday hours that run from early morning into late afternoon, in line with a typical school day that includes extended care before and after formal classes. It is run as a private, fee-paying institution rather than a state school, and its pupil body has numbered in the low hundreds in recent years, making it a mid-sized option for families in the Bronberrik and wider Centurion area looking for a faith-based schooling alternative through to matric.',
  'Mon-Fri 06:30-17:30, Sat Closed, Sun Closed',
  '["https://centurionliving.co.za/businesses/zwartkop-christian-school/", "https://skools.co.za/listings/zwartkop-christian-school/", "https://za.africabz.com/gauteng/zwartkop-christian-school-82254", "https://www.cylex.net.za/company/zwartkop-christian-school-17554449.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zwartkop-christian-school-bronberrik'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
