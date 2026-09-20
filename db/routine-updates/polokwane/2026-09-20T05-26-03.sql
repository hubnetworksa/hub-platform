UPDATE businesses
SET description = 'Ace Auto Salvage is a Ladanna vehicle scrapyard and part of the Ace Auto Group, founded in 1988, stripping used vehicles to sell new and used spares with online ordering and nationwide delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.aceautosalvage.co.za/", "https://www.yellowpages.co.za/business/17055638_3", "https://www.thinklocal.co.za/biz/ace-auto-salvage-polokwane"]'
WHERE slug = 'ace-auto-salvage-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brave Group Security Services is a private security company based in Ladanna, providing security services to homes and businesses across greater Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'brave-group-security-services-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brilliant Bass Boats & Fishing Tackle is a retail and wholesale supplier of boats, fishing tackle and boating accessories and equipment, based in Superbia.',
    description_enriched_at = datetime('now')
WHERE slug = 'brilliant-bass-boats-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Firefly Foods is a butchery and deli in Ladanna selling cold meats, russians, viennas, cheese and frozen foods; since buying its own meat-processing factory in 2014, it produces its own cold meat products rather than buying them in.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/16534960_2", "http://www.fireflyfoods.co.za/about%20us.htm", "https://www.facebook.com/FireflyFactoryShop/"]'
WHERE slug = 'firefly-foods-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fred''s Towing has operated in Ladanna since 1998 and is one of the longer-established towing operators in Limpopo, offering towing, roadside assistance, vehicle recovery and plant rental.',
    description_enriched_at = datetime('now')
WHERE slug = 'freds-towing-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Glass Doctor is a windscreen replacement and repair franchise in Superbia, also handling side and rear glass replacement, chip repairs and vehicle glass checks, part of a national network with branches across several provinces.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.ypgo.net/Glass+Doctor-22059950956", "https://www.thinklocal.co.za/biz/glass-doctor-polokwane", "https://www.brabys.com/za/limpopo/polokwane/superbia/windscreens-replacements-repairs/glass-doctor", "https://www.glassdoctor.co.za/"]'
WHERE slug = 'glass-doctor-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Great North Workshop is a motor vehicle repair and servicing workshop in Superbia offering general car repairs and maintenance.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun Closed',
    source_urls = '["https://www.thinklocal.co.za/biz/great-north-workshop-polokwane", "https://www.brabys.com/za/limpopo/polokwane/superbia/motor-car-repairs/great-north-workshop", "https://www.yep.co.za/biz/store/great-north-workshop/340692", "https://www.africanadvice.com/1178236/Motor_Car_Repairs_And_Maintenance/Limpopo/Great_North_Workshop/"]'
WHERE slug = 'great-north-workshop-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Piglets Daycare is a small daycare and creche for young children in Ladanna.',
    description_enriched_at = datetime('now')
WHERE slug = 'piglets-daycare-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rabe Construction is a building contractor in Superbia offering house extensions, kitchen and bathroom renovations, and general building construction and contracting services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://yellowpages.co.za/business/10217931_3", "https://www.netpages.co.za/Polokwane/Rabe+Construction-14289.html", "https://nearfinderza.com/en/business/limpopo/polokwane/building-contractors/rabe-construction_88525+4.html", "https://www.procompare.co.za/providers/rabe-construction-1"]'
WHERE slug = 'rabe-construction-superbia' AND description_enriched_at IS NULL;
