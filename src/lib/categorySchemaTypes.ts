// Maps every category slug to its correct schema.org type for JSON-LD,
// instead of the generic `LocalBusiness` every business page used
// previously. Google's own guidance is that a specific subtype helps
// match a business to relevant queries better than the generic parent
// type does. Every value here was checked directly against schema.org's
// own type pages before being added — most are real LocalBusiness
// subtypes (schema.org/LocalBusiness and its documented children); a
// handful (PlaceOfWorship, EventVenue, Museum, EducationalOrganization)
// are CivicStructure types instead, which is the more accurate schema.org
// branch for those and still support `address`/`telephone` the same way.
// `ProfessionalService` is the deliberate fallback for categories with no
// closer real subtype (schema.org doesn't have one for every trade) —
// never invent a type name that isn't actually documented on schema.org.

export const CATEGORY_SCHEMA_TYPES: Record<string, string> = {
  accommodation: 'LodgingBusiness',
  accountants: 'AccountingService',
  'agricultural-farming-supplies': 'Store',
  'appliance-repairs': 'HomeAndConstructionBusiness',
  'attorneys-legal': 'Attorney',
  'automotive-repairs': 'AutoRepair',
  bakeries: 'Bakery',
  'banks-atms': 'BankOrCreditUnion',
  barbershops: 'HairSalon',
  'beauty-hair-salons': 'BeautySalon',
  'bookkeeping-services': 'AccountingService',
  'books-stationery': 'BookStore',
  'borehole-water-services': 'HomeAndConstructionBusiness',
  'building-construction': 'GeneralContractor',
  'building-materials-timber-merchants': 'HardwareStore',
  'business-consulting': 'ProfessionalService',
  butcheries: 'Store',
  'car-dealerships': 'AutoDealer',
  'car-wash-detailing': 'AutoWash',
  catering: 'FoodEstablishment',
  'churches-religious-organisations': 'PlaceOfWorship',
  'cleaning-services': 'HomeAndConstructionBusiness',
  'clinics-healthcare': 'MedicalClinic',
  'commercial-property-office-space': 'RealEstateAgent',
  'computer-it-services': 'ProfessionalService',
  'construction-claims-management': 'ProfessionalService',
  'convenience-stores': 'ConvenienceStore',
  dentists: 'Dentist',
  'doctors-gps': 'Physician',
  'driving-schools': 'ProfessionalService',
  electricians: 'Electrician',
  'electronics-appliances': 'ElectronicsStore',
  'engineering-surveying': 'ProfessionalService',
  'estate-agents': 'RealEstateAgent',
  'events-function-venues': 'EventVenue',
  'fashion-clothing': 'ClothingStore',
  'fencing-security-installations': 'HomeAndConstructionBusiness',
  'financial-investment-services': 'FinancialService',
  'fitness-gyms': 'HealthClub',
  florists: 'Florist',
  'fuel-stations': 'GasStation',
  'funeral-services': 'ProfessionalService',
  'furniture-homeware': 'FurnitureStore',
  'general-retail': 'Store',
  'government-municipal-services': 'GovernmentOffice',
  'hardware-stores': 'HardwareStore',
  hotels: 'Hotel',
  'industrial-suppliers-manufacturing': 'Store',
  insurance: 'InsuranceAgency',
  jewellers: 'JewelryStore',
  'liquor-stores': 'LiquorStore',
  locksmiths: 'Locksmith',
  'logistics-courier-transport': 'ProfessionalService',
  'marketing-advertising': 'ProfessionalService',
  'mobile-phones': 'MobilePhoneStore',
  'motor-spares': 'AutoPartsStore',
  'museums-heritage-sites': 'Museum',
  'nurseries-garden-centres': 'GardenStore',
  opticians: 'Optician',
  'painters-decorators': 'HousePainter',
  'panel-beaters-spray-painters': 'AutoBodyShop',
  'party-event-hire': 'ProfessionalService',
  'pest-control': 'HomeAndConstructionBusiness',
  'pet-stores': 'PetStore',
  pharmacies: 'Pharmacy',
  photographers: 'ProfessionalService',
  physiotherapists: 'Physiotherapy',
  plumbers: 'Plumber',
  'printing-services': 'ProfessionalService',
  'recruitment-hr-services': 'EmploymentAgency',
  'restaurants-takeaways': 'Restaurant',
  'roofing-contractors': 'RoofingContractor',
  'rubbish-rubble-removal': 'HomeAndConstructionBusiness',
  'schools-education': 'EducationalOrganization',
  'security-services': 'ProfessionalService',
  'shoe-stores': 'ShoeStore',
  'software-development': 'ProfessionalService',
  'solar-renewable-energy': 'HomeAndConstructionBusiness',
  'spas-wellness': 'DaySpa',
  'supermarkets-groceries': 'GroceryStore',
  'tax-practitioners': 'AccountingService',
  'tow-trucks-roadside': 'AutoRepair',
  'toy-stores': 'ToyStore',
  'traditional-healers': 'ProfessionalService',
  'travel-agents': 'TravelAgency',
  'tyre-fitment-centres': 'TireShop',
  'vets-animal-care': 'VeterinaryCare',
  'wedding-services': 'ProfessionalService',
};

/** Falls back to the generic (but always valid) `LocalBusiness` type for
 *  any category slug not in the table above. */
export function schemaTypeFor(categorySlug: string): string {
  return CATEGORY_SCHEMA_TYPES[categorySlug] ?? 'LocalBusiness';
}

/** The generic fallback used above for any category with no closer
 *  schema.org subtype — also what a new admin-added category gets when
 *  the admin leaves "Schema type" unset (see functions/api/admin/
 *  categories.ts). */
export const DEFAULT_SCHEMA_TYPE = 'LocalBusiness';

/** Every schema.org type this table actually uses, plus the fallback
 *  above — the finite set the admin "Add category" form is allowed to
 *  pick from, so a category can never end up with a made-up type that
 *  isn't one of the real, checked-against-schema.org values already
 *  vetted for the rest of the site (see the file header comment). */
export const KNOWN_SCHEMA_TYPES: string[] = [...new Set([DEFAULT_SCHEMA_TYPE, ...Object.values(CATEGORY_SCHEMA_TYPES)])].sort();

export function isKnownSchemaType(value: string): boolean {
  return KNOWN_SCHEMA_TYPES.includes(value);
}
