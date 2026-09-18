// Search/SEO keyword synonyms per category — informal terms, trade jargon,
// and near-synonyms real people type that don't literally appear in the
// formal category name (e.g. "junk removal" for Rubbish & Rubble Removal).
// Shared across all sites, same as categoryGroups.ts — purely additive,
// never changes a category's actual slug/name/URL. Used to:
//  - widen on-site search matching (search-index.json.ts / SearchBox.astro)
//  - enrich category page meta descriptions and on-page copy
//  - populate `keywords` in business/category JSON-LD structured data
//
// Owner should review/extend this over time as new phrasing turns up in
// search console queries — it's a hand-drafted starting list, not sourced
// from real query data yet.

export const CATEGORY_SYNONYMS: Record<string, string[]> = {
  accommodation: [
    'guesthouse', 'guest house', 'guesthouses', 'guest houses', 'bnb', 'b&b', "b&b's",
    'bed and breakfast', 'self-catering', 'self-catering accommodation', 'lodge', 'lodges',
    'backpackers', 'boutique hotel', 'overnight accommodation', 'places to stay', 'accommodation near me',
  ],
  accountants: ['accounting', 'accountants', 'accounting firm', 'auditor', 'cipc registration', 'company registration'],
  'agricultural-farming-supplies': [
    'farm supplies', 'farming equipment', 'agri supplies', 'feed store', 'animal feed', 'farmers co-op',
    'irrigation supplies', 'livestock supplies',
  ],
  'agriculture-forestry': [
    'farm', 'farms', 'farming', 'forestry', 'forestry services', 'tree felling', 'logging', 'land clearing',
    'game farm', 'agricultural contractor',
  ],
  'appliance-repairs': [
    'fridge repair', 'washing machine repair', 'stove repair', 'appliance technician', 'oven repair',
    'dishwasher repair', 'tumble dryer repair', 'microwave repair',
  ],
  'attorneys-legal': [
    'lawyer', 'lawyers', 'attorneys', 'law firm', 'legal services', 'advocate', 'conveyancer',
    'conveyancing attorney', 'divorce lawyer', 'notary',
  ],
  'automotive-repairs': [
    'car repair', 'car repairs', 'mechanic', 'mechanics', 'auto repair', 'car service', 'engine repair',
    'car diagnostics', 'clutch repair', 'gearbox repair',
  ],
  bakeries: [
    'bakery', 'bakeries', 'cakes', 'cake shop', 'custom cakes', 'wedding cakes', 'cupcakes', 'pastries',
    'confectionery', 'fresh bread',
  ],
  'banks-atms': ['bank', 'banks', 'atm', 'atms', 'cash machine', 'bank branch', 'banking hall'],
  barbershops: ['barber', 'barbers', 'barbershop', 'mens haircut', "men's hair salon", 'haircuts', 'fade', 'kids haircuts'],
  'beauty-hair-salons': [
    'hair salon', 'hair salons', 'hairdresser', 'nail salon', 'beauty parlour', 'hair stylist', 'nails', 'nail bar',
    'braiding salon', 'lash technician',
  ],
  'bookkeeping-services': [
    'bookkeeper', 'bookkeepers', 'accounts', 'payroll services', 'bookkeeping', 'vat returns',
    'small business accounting',
  ],
  'books-stationery': ['bookstore', 'book shop', 'stationery shop', 'stationers', 'office supplies', 'school stationery', 'printer supplies'],
  'borehole-water-services': [
    'borehole drilling', 'water tank installation', 'well drilling', 'jojo tank', 'borehole pump',
    'borehole services', 'water storage tanks', 'borehole testing',
  ],
  'building-construction': [
    'builder', 'builders', 'building contractor', 'construction company', 'renovations', 'home builder',
    'handyman', 'handyman services', 'home renovations', 'general contractor',
  ],
  'building-materials-timber-merchants': [
    'hardware wholesaler', 'timber yard', 'timber merchant', 'building supplies', 'cement supplier',
    'sand and stone', 'brick supplier', 'roof trusses',
  ],
  'business-consulting': ['management consultant', 'business advisor', 'strategy consultant', 'business consultant', 'business coach'],
  butcheries: [
    'butchery', 'butcheries', 'butcher', 'butchers', 'meat shop', 'meat market', 'biltong', 'biltong shop',
    'droewors', 'shisa nyama',
  ],
  'car-dealerships': [
    'car dealer', 'car dealers', 'used cars', 'used car dealer', 'new car sales', 'motor dealership', 'car sales',
    'pre-owned cars', 'car showroom',
  ],
  'car-wash-detailing': ['car wash', 'car washes', 'valet', 'valet service', 'auto detailing', 'car cleaning', 'mobile car wash'],
  catering: [
    'caterer', 'caterers', 'event catering', 'party food', 'catering services', 'wedding catering',
    'corporate catering', 'buffet catering',
  ],
  'churches-religious-organisations': [
    'church', 'churches', 'mosque', 'temple', 'synagogue', 'place of worship', 'worship centre', 'ministries',
    'congregation',
  ],
  'cleaning-services': [
    'cleaners', 'domestic cleaning', 'office cleaning', 'house cleaning', 'cleaning company', 'cleaning services',
    'carpet cleaning', 'deep cleaning', 'move-in cleaning',
  ],
  'clinics-healthcare': ['clinic', 'clinics', 'medical centre', 'health centre', 'day clinic', 'healthcare centre', 'walk-in clinic'],
  'commercial-property-office-space': [
    'office space to let', 'commercial property', 'office rental', 'warehouse to rent', 'shop to let',
    'industrial property to let', 'retail space to let',
  ],
  'computer-it-services': [
    'computer repair', 'it support', 'laptop repair', 'tech support', 'network support', 'it services',
    'computer technician', 'data recovery',
  ],
  'convenience-stores': ['spaza shop', 'spaza', 'corner shop', 'tuck shop', 'cafe', 'café', 'convenience shop'],
  dentists: ['dentist', 'dentists', 'dental practice', 'teeth', 'dental clinic', 'tooth extraction', 'braces', 'dental surgery'],
  'doctors-gps': [
    'doctor', 'doctors', 'gp', 'gps', 'general practitioner', 'medical doctor', 'family doctor', "doctor's rooms",
    'medical practice',
  ],
  'driving-schools': [
    'driving lessons', 'driving school', "learner's licence", 'learners licence', 'k53', 'drivers licence',
    'code 8 licence', 'code 10 licence',
  ],
  electricians: [
    'electrician', 'electricians', 'electrical contractor', 'wiring', 'electrical repairs', 'coc certificate',
    'certificate of compliance', 'electrical fault finding',
  ],
  'electronics-appliances': [
    'electronics shop', 'appliance store', 'appliance shop', 'tv shop', 'electronics store', 'fridge shop',
    'electronics repairs',
  ],
  'engineering-surveying': [
    'engineer', 'engineers', 'land surveyor', 'land surveying', 'civil engineer', 'structural engineer',
    'quantity surveyor',
  ],
  'estate-agents': [
    'real estate agent', 'estate agents', 'property agent', 'realtor', 'houses for sale', 'property for sale',
    'letting agent', 'property to rent', 'property management',
  ],
  'events-function-venues': [
    'function venue', 'function venues', 'wedding venue', 'conference venue', 'conference centre', 'event hall',
    'venue hire', 'banquet hall',
  ],
  'fashion-clothing': [
    'clothing store', 'clothing shop', 'fashion shop', 'fashion store', 'boutique', 'clothes shop', 'menswear',
    'womenswear', 'clothing boutique',
  ],
  'fencing-security-installations': [
    'fence installer', 'security gates', 'electric fencing', 'palisade fencing', 'razor wire',
    'fencing contractor', 'automated gates', 'burglar bars',
  ],
  'financial-investment-services': [
    'financial advisor', 'investment company', 'wealth management', 'financial planner', 'financial planning',
    'stockbroker', 'retirement planning',
  ],
  'fitness-gyms': ['gym', 'gyms', 'fitness centre', 'fitness club', 'personal trainer', 'crossfit', 'boxing gym'],
  florists: ['florist', 'florists', 'flower shop', 'flower delivery', 'flowers', 'bouquet delivery', 'funeral flowers'],
  'fuel-stations': ['petrol station', 'petrol stations', 'garage', 'filling station', 'gas station', 'diesel'],
  'funeral-services': [
    'funeral parlour', 'funeral parlours', 'undertaker', 'funeral home', 'mortuary', 'funeral cover',
    'cremation services',
  ],
  'furniture-homeware': [
    'furniture store', 'furniture shops', 'homeware shop', 'homeware store', 'home decor', 'furniture shop', 'décor shop',
  ],
  'general-retail': ['general dealer', 'general store', 'variety store', 'discount store'],
  'government-municipal-services': [
    'municipality', 'home affairs', 'department of home affairs', 'licensing department', 'government office',
    'municipal offices', 'sassa office', 'traffic department',
  ],
  'hardware-stores': ['hardware shop', 'hardware store', 'diy store', 'tool shop', 'tools shop', 'builders warehouse', 'paint shop'],
  hotels: ['hotel', 'hotels', 'guest lodge', 'hotel accommodation', 'overnight stay'],
  'industrial-suppliers-manufacturing': [
    'factory', 'manufacturer', 'manufacturers', 'industrial supplier', 'wholesaler', 'industrial equipment',
    'factory supplies',
  ],
  insurance: [
    'insurance broker', 'car insurance', 'life insurance', 'short-term insurance', 'medical aid broker',
    'medical aid', 'funeral policy', 'home insurance',
  ],
  jewellers: ['jewellery shop', 'jeweller', 'jewellers', 'jewelry store', 'jewellery repairs', 'engagement rings', 'watch repairs'],
  'liquor-stores': [
    'bottle store', 'bottle stores', 'off-licence', 'liquor shop', 'bottle shop', 'liquor store', 'wine shop',
    'alcohol shop',
  ],
  locksmiths: [
    'locksmith', 'locksmiths', 'key cutting', 'lock repair', 'car key replacement', 'emergency locksmith',
    'safe unlocking', 'spare keys',
  ],
  'logistics-courier-transport': [
    'courier service', 'courier services', 'delivery service', 'freight', 'removals', 'removal company',
    'transport company', 'furniture removals',
  ],
  'marketing-advertising': [
    'marketing agency', 'advertising agency', 'digital marketing', 'social media marketing', 'branding agency',
    'seo agency', 'graphic design',
  ],
  'mobile-phones': [
    'cell phone shop', 'cellphone shop', 'phone repairs', 'smartphone store', 'cellphone repairs',
    'phone accessories', 'screen replacement',
  ],
  'motor-spares': [
    'car parts', 'auto spares', 'motor spares', 'spare parts shop', 'second hand parts', 'scrap yard', 'scrapyard',
    'used car parts',
  ],
  'museums-heritage-sites': ['museum', 'museums', 'heritage site', 'historical site', 'art gallery', 'cultural centre'],
  'nurseries-garden-centres': [
    'plant nursery', 'nurseries', 'garden centre', 'landscaping supplies', 'plants', 'garden services',
    'landscaping', 'indigenous plants',
  ],
  opticians: ['optometrist', 'opticians', 'eye test', 'spectacles', 'glasses shop', 'eye care', 'contact lenses', 'sunglasses shop'],
  'painters-decorators': [
    'painter', 'painters', 'house painter', 'decorator', 'painting contractor', 'interior painting',
    'exterior painting', 'wallpaper installer',
  ],
  'panel-beaters-spray-painters': [
    'panel beater', 'panel beaters', 'car body repair', 'spray painter', 'spray painting', 'smash repairs',
    'auto body repairs', 'dent repair',
  ],
  'party-event-hire': [
    'party hire', 'tent hire', 'event equipment hire', 'jumping castle hire', 'chair hire', 'table hire',
    'marquee hire', 'decor hire',
  ],
  'pest-control': [
    'exterminator', 'fumigation', 'pest removal', 'termite treatment', 'pest control', 'cockroach control',
    'rodent control', 'bed bug treatment',
  ],
  'pet-stores': ['pet shop', 'pet shops', 'pet supplies', 'pet food', 'pet grooming', 'aquarium supplies'],
  pharmacies: ['pharmacy', 'pharmacies', 'chemist', 'chemists', 'drugstore', 'dispensary'],
  photographers: [
    'photographer', 'photographers', 'photo studio', 'wedding photographer', 'portrait photography',
    'matric dance photographer', 'corporate photographer', 'event photographer',
  ],
  physiotherapists: ['physio', 'physiotherapists', 'physiotherapy', 'sports injury', 'rehabilitation therapy', 'back pain treatment'],
  plumbers: [
    'plumber', 'plumbers', 'plumbing services', 'burst pipe', 'geyser repair', 'blocked drain',
    'geyser installation', 'leak detection',
  ],
  'printing-services': [
    'printers', 'printing shop', 'signage', 'banner printing', 'digital printing', 'vehicle branding',
    'business cards printing',
  ],
  'recruitment-hr-services': [
    'recruitment agency', 'job agency', 'staffing agency', 'hr consultant', 'headhunter', 'temp staff agency',
    'labour law consultant',
  ],
  'restaurants-takeaways': [
    'restaurant', 'restaurants', 'takeaway', 'takeaways', 'takeout', 'fast food', 'food delivery',
    'shisa nyama', 'braai', 'diner', 'eatery', 'lunch spot',
  ],
  'roofing-contractors': [
    'roofer', 'roofers', 'roof repair', 'roof waterproofing', 'roof leak', 'roofing contractor', 'gutter repair',
    'ceiling repair',
  ],
  'rubbish-rubble-removal': [
    'junk removal', 'rubbish removal', 'rubble removal', 'waste removal', 'garden refuse removal', 'garden refuse',
    'skip hire', 'builders rubble', 'bin hire',
  ],
  'schools-education': [
    'school', 'schools', 'tutoring', 'tutor', 'education centre', 'preschool', 'nursery school', 'crèche', 'creche',
    'aftercare',
  ],
  'security-services': [
    'security company', 'security companies', 'armed response', 'guarding services', 'cctv installation',
    'alarm systems', 'access control',
  ],
  'shoe-stores': ['shoe shop', 'shoe store', 'footwear store', 'footwear shop', 'shoes', 'sneakers'],
  'software-development': [
    'app developer', 'web developer', 'software company', 'app development', 'web design', 'web design company',
    'website developer',
  ],
  'solar-renewable-energy': [
    'solar installer', 'solar installers', 'solar panels', 'inverter installation', 'load shedding solutions',
    'inverter', 'backup power', 'generator installation', 'battery backup',
  ],
  'spas-wellness': ['spa', 'spas', 'massage', 'massage therapist', 'wellness centre', 'day spa', 'facial treatments'],
  'supermarkets-groceries': [
    'supermarket', 'supermarkets', 'grocery store', 'groceries', 'grocery shop', 'food market', 'superette',
  ],
  'tax-practitioners': ['tax consultant', 'tax practitioner', 'tax returns', 'sars', 'sars efiling', 'tax advisor', 'provisional tax'],
  'tow-trucks-roadside': [
    'tow truck', 'tow trucks', 'roadside assistance', 'vehicle recovery', 'car towing', 'breakdown recovery',
    'jump start service',
  ],
  'toy-stores': ['toy shop', 'toy store', 'toys', 'toys and games', 'kids toys'],
  'traditional-healers': ['sangoma', 'inyanga', 'traditional medicine', 'diviner', 'herbalist'],
  'travel-agents': ['travel agency', 'travel agents', 'flight bookings', 'holiday packages', 'tour operator', 'visa applications'],
  'tyre-fitment-centres': [
    'tyre shop', 'tyre shops', 'wheel alignment', 'tyre fitment', 'puncture repair', 'wheel balancing', 'new tyres',
  ],
  'vets-animal-care': ['vet', 'vets', 'veterinarian', 'veterinary clinic', 'animal hospital', 'animal clinic', 'pet vaccinations'],
  'wedding-services': ['wedding planner', 'wedding planners', 'bridal services', 'wedding coordinator', 'bridal shop', 'wedding decor'],
};

export function synonymsFor(categorySlug: string): string[] {
  return CATEGORY_SYNONYMS[categorySlug] ?? [];
}

// City-qualified search terms (e.g. "polokwane accommodation", "plumbers
// in pretoria") — kept separate from CATEGORY_SYNONYMS above because that
// list is shared across all three sites and a hardcoded city name would
// be wrong on the other two. Takes the category's own display name and
// the live site's cityLabel, so it's correct wherever it's called from.
export function locationSynonymsFor(categoryName: string, cityLabel: string): string[] {
  const cat = categoryName.toLowerCase();
  const city = cityLabel.toLowerCase();
  return [`${city} ${cat}`, `${cat} in ${city}`];
}

// Suburb-qualified search terms (e.g. "plumbers flora park", "flora park
// plumbers") — the same near-me/in-<place> query pattern as
// locationSynonymsFor above, one level more specific. Only ever called from
// category/[slug]/[suburb].astro, which itself only generates pages for
// suburb+category combinations that already have real listings — this never
// manufactures a keyword claim for a suburb with nothing there.
export function suburbSynonymsFor(categoryName: string, suburbName: string): string[] {
  const cat = categoryName.toLowerCase();
  const suburb = suburbName.toLowerCase();
  return [`${cat} ${suburb}`, `${cat} in ${suburb}`, `${suburb} ${cat}`];
}
