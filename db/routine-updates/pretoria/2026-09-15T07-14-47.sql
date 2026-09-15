UPDATE businesses
SET description = 'A ten-pin bowling alley and entertainment venue at Eco Boulevard Mall, Eco Park, offering 10 bowling lanes alongside a sports bar, pool tables, ping pong and board games.',
    description_enriched_at = datetime('now')
WHERE slug = 'beyond-bowling-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A BP-branded fuel station in Eersterust offering premium petrol and diesel, with an on-site Express Shop stocking convenience items like bread, milk and cold drinks.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://textmap.co.za/6/24396", "https://www.callupcontact.com/b/businessprofile2/BP_Eersterust_Motors/4476047", "https://map.bp.com/en-ZA/ZA/gas-station/eersterust/eersterust-motors/EERSHANA4R"]'
WHERE slug = 'bp-eersterust-motors-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Checkers supermarket branch at Eco Boulevard Shopping Centre in Eco Park, part of the retail and dining precinct alongside stores like KFC and Virgin Active.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wanderlog.com/place/details/6850175/eco-boulevard-shopping-centre"]'
WHERE slug = 'checkers-eco-boulevard-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A building materials supplier in Hesteapark stocking bricks, blocks, paving bricks, sand and cement (including PPC Surebuild and BB Cement 32.5), with delivery available for small to large loads.',
    description_enriched_at = datetime('now')
WHERE slug = 'de-souza-hardware-hesteapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An accommodation option in Derdepoort, on the eastern edge of the Pretoria/Tshwane metro.',
    description_enriched_at = datetime('now')
WHERE slug = 'derdepoort-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An IT services company in Dorandia offering computer and network support alongside graphic design and digital marketing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'dgmit-solutions-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Dis-Chem pharmacy branch at Elardus Park Shopping Centre, offering a Baby Wellness Clinic alongside standard pharmacy and health/beauty retail.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:00-15:00, Sun 09:00-14:00'
WHERE slug = 'dis-chem-elarduspark-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A business consulting service in Monavoni, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'e-bizwhizz-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A custom embroidery and branding business in Constantia Park, producing branded corporate clothing, personalised gifts, school bags and badges, with nationwide corporate clothing supply.',
    description_enriched_at = datetime('now')
WHERE slug = 'ebranding-embroidery-printing-supply-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An IT services company in Theresapark.',
    description_enriched_at = datetime('now')
WHERE slug = 'clat-technologies-pty-ltd-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A commercial property and office space business in Montana Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'eco-one-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A digital marketing agency in Bryntirion offering web development, Google Ads, SEO, social media marketing and graphic design, with a dedicated eHotels division serving the hospitality industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'ecom-south-africa-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A software development company in Jan Niemand Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'edream-productions-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'An events management company in Heuweloord, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'el-and-tee-events-management-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A pet shop and dog grooming parlour at Elardus Park Shopping Centre, offering pet products and professional grooming for dogs and cats, in operation for over 20 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun 09:00-13:00'
WHERE slug = 'elarduspark-pet-shop-and-dog-parlor-elardus-park' AND description_enriched_at IS NULL;
