import suburbsRaw from '../data/suburbs.json';
import categoriesRaw from '../data/categories.json';
import businessesRaw from '../data/businesses.json';
import businessCategoriesRaw from '../data/business-categories.json';
import shoppingCentersRaw from '../data/shopping-centers.json';

export interface Suburb {
  id: number;
  slug: string;
  name: string;
  /** Site-specific macro-region slug (e.g. "polokwane"/"seshego"/"limpopo-other" for
   *  Polokwane, "pretoria"/"centurion"/"gauteng-other" for Pretoria) — see
   *  src/site-content/<slug>/areaGroups.ts's regionLabel() for display names. */
  region: string;
  bio: string | null;
  landmarks: string | null;
  lat: number | null;
  lng: number | null;
  image_key: string | null;
}

export interface Category {
  id: number;
  slug: string;
  name: string;
}

export interface ShoppingCenter {
  id: number;
  slug: string;
  name: string;
  suburb_id: number | null;
  address: string | null;
  lat: number | null;
  lng: number | null;
  type: 'mall' | 'fuel_station';
  description: string | null;
}

export interface Business {
  id: number;
  slug: string;
  name: string;
  suburb_id: number;
  address: string | null;
  phone: string | null;
  website: string | null;
  email: string | null;
  description: string;
  lat: number | null;
  lng: number | null;
  source_urls: string;
  shopping_center_id: number | null;
  hours: string | null;
}

interface BusinessCategoryLink {
  business_id: number;
  category_id: number;
  is_primary: number;
}

export const suburbs = suburbsRaw as Suburb[];
export const categories = categoriesRaw as Category[];
export const businesses = businessesRaw as Business[];
export const shoppingCenters = shoppingCentersRaw as ShoppingCenter[];
const businessCategories = businessCategoriesRaw as BusinessCategoryLink[];

const suburbById = new Map(suburbs.map((s) => [s.id, s]));
const categoryById = new Map(categories.map((c) => [c.id, c]));
const businessById = new Map(businesses.map((b) => [b.id, b]));
const shoppingCenterById = new Map(shoppingCenters.map((c) => [c.id, c]));

const categoriesByBusinessId = new Map<number, Category[]>();
const businessesByCategoryId = new Map<number, Business[]>();
for (const link of businessCategories) {
  const category = categoryById.get(link.category_id);
  const business = businessById.get(link.business_id);
  if (!category || !business) continue;
  if (!categoriesByBusinessId.has(link.business_id)) categoriesByBusinessId.set(link.business_id, []);
  categoriesByBusinessId.get(link.business_id)!.push(category);
  if (!businessesByCategoryId.has(link.category_id)) businessesByCategoryId.set(link.category_id, []);
  businessesByCategoryId.get(link.category_id)!.push(business);
}

const businessesBySuburbId = new Map<number, Business[]>();
for (const business of businesses) {
  if (!businessesBySuburbId.has(business.suburb_id)) businessesBySuburbId.set(business.suburb_id, []);
  businessesBySuburbId.get(business.suburb_id)!.push(business);
}

const businessesByShoppingCenterId = new Map<number, Business[]>();
for (const business of businesses) {
  if (business.shopping_center_id == null) continue;
  if (!businessesByShoppingCenterId.has(business.shopping_center_id)) businessesByShoppingCenterId.set(business.shopping_center_id, []);
  businessesByShoppingCenterId.get(business.shopping_center_id)!.push(business);
}

export const suburbBySlug = (slug: string) => suburbs.find((s) => s.slug === slug);
export const categoryBySlug = (slug: string) => categories.find((c) => c.slug === slug);
export const businessBySlug = (slug: string) => businesses.find((b) => b.slug === slug);
export const shoppingCenterBySlug = (slug: string) => shoppingCenters.find((c) => c.slug === slug);
export const suburbFor = (business: Business) => suburbById.get(business.suburb_id);
export const categoriesFor = (business: Business) => categoriesByBusinessId.get(business.id) ?? [];
export const businessesInSuburb = (suburbId: number) => businessesBySuburbId.get(suburbId) ?? [];
export const businessesInCategory = (categoryId: number) => businessesByCategoryId.get(categoryId) ?? [];
export const businessesInShoppingCenter = (id: number) => businessesByShoppingCenterId.get(id) ?? [];

// Only meaningful when it actually has businesses linked — a shopping
// centre imported from OSM with nothing nearby yet shouldn't be treated
// as "real" for display/linking purposes.
export function shoppingCenterFor(business: Business): ShoppingCenter | undefined {
  if (business.shopping_center_id == null) return undefined;
  return shoppingCenterById.get(business.shopping_center_id);
}

export function businessesInSuburbAndCategory(suburbId: number, categoryId: number) {
  return businessesInCategory(categoryId).filter((b) => b.suburb_id === suburbId);
}

export function parseSourceUrls(business: Business): string[] {
  try {
    return JSON.parse(business.source_urls);
  } catch {
    return [];
  }
}
