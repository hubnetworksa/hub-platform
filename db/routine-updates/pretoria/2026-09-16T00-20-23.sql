UPDATE businesses
SET description = 'Inprofex is a building and construction business based in Lyttelton Manor, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'inprofex-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inqaba Biotechnical Industries, trading as inqaba biotec, is a genomics company established in 2002 and based in Muckleneuk, offering DNA sequencing, oligonucleotide synthesis, SNP and methylation analysis, and bioinformatics services, and distributing life-science laboratory equipment and reagents from international manufacturers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.inqababiotec.co.za/", "https://www.up.ac.za/faculty-of-health-sciences-research/inqaba-biotechnical-industries-pty-ltd-0"]'
WHERE slug = 'inqaba-biotechnical-industries-pty-ltd-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inry Pale and Top Thatch is a thatching contractor that has operated since 1989, specialising in thatch roof installations and repairs and supplying thatching materials such as grass, cape reed, timber poles, laths and droppers, with exports to Namibia and Angola.',
    description_enriched_at = datetime('now')
WHERE slug = 'inry-pale-and-top-thatch-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inscorp Insurance Brokers is an independent brokerage established in 2012, specialising in business insurance including non-conventional motor fleet, transport, liability and commercial cover, alongside home and car insurance for individual clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30',
    source_urls = '["https://www.inscorp.co.za/", "https://www.sayellow.com/view/south-africa/inscorp-insurance-brokers-in-centurion"]'
WHERE slug = 'inscorp-insurance-brokers-pty-ltd-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Insel Attorneys is a Pretoria North law firm handling criminal law matters such as bail applications, drink-driving charges and wrongful arrest cases, alongside corporate and commercial law work including company liquidation and claims against companies.',
    description_enriched_at = datetime('now')
WHERE slug = 'insel-attorneys-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Insight Business Accounting is an accounting firm serving businesses in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'insight-business-accounting-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Insight Property Services is a financial and investment services provider based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'insight-property-services-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Intrinsyc Dzumba Group, trading as IDG Africa, is a black-owned systems integrator based in Doringkloof with more than 15 years of experience, providing IT services and consulting, professional training, systems engineering and renewable energy solutions to government and private-sector clients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["scraped:google-places-no-website", "https://www.intrinsycdzumba.co.za/"]'
WHERE slug = 'intrinsyc-dzumba-group-doringkloof' AND description_enriched_at IS NULL;
