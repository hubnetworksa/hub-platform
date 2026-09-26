UPDATE businesses
SET description = 'Lafixa IT Solutions is a computer repair and IT support workshop in Nirvana, Polokwane, offering PC and laptop repairs, upgrades and replacement of faulty components.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-20:00, Sun Closed',
    source_urls = '["https://www.facebook.com/MoalafiTechnologies/", "https://www.shopshours.co.za/computer-repair/polokwane", "https://polokwane.infoisinfo.co.za/search/computer-repair"]'
WHERE slug = 'lafixa-it-solutions-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rabie Panel Beaters is a panelbeating and spray-painting workshop in Nirvana, Polokwane, established in 2016, repairing everything from minor dents to major structural bodywork.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/rabiepanelbeaterspolokwane", "https://www.autoyas.com/ZA/Polokwane/1973942872890130/Rabie-Panel-Beaters", "https://rabiepanelbeater.wordpress.com/2018/12/02/about-us/"]'
WHERE slug = 'rabie-panel-beaters-nirvana' AND description_enriched_at IS NULL;
