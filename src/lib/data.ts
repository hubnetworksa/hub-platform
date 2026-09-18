import suburbsRaw from '../data/suburbs.json';
import categoriesRaw from '../data/categories.json';
import businessesRaw from '../data/businesses.json';
import businessCategoriesRaw from '../data/business-categories.json';
import shoppingCentersRaw from '../data/shopping-centers.json';
import businessPhotosRaw from '../data/business-photos.json';
import sponsorshipsRaw from '../data/sponsorships.json';

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
  owner_user_id: number | null;
  /** 0 = Basic/Free, 1 = Verified, 2 = Featured — see functions/_lib/pricing.ts's TIER_NAMES. */
  subscription_tier: number;
  subscription_status: string | null;
  subscription_expires_at: string | null;
}

/** The Featured tier's numeric value — gates the Photos gallery and
 *  "Featured this month"/search-pin placement. Kept in sync by hand with
 *  functions/_lib/pricing.ts's TIER_NAMES (that file can't be imported
 *  from build-time Astro code — it's bundled separately for Pages
 *  Functions — so the tier numbers are just duplicated as a constant). */
export const FEATURED_TIER = 2;

export interface BusinessPhoto {
  id: number;
  business_id: number;
  r2_key: string;
  sort_order: number;
  caption: string | null;
}

/** An active, currently-sold exclusive sponsorship slot — see
 *  functions/_lib/pricing.ts's SponsorProductType. Build-time snapshot,
 *  same rebuild-to-refresh pattern as every other static data file here. */
export interface Sponsorship {
  id: number;
  product_type: 'category_sponsor' | 'suburb_sponsor' | 'homepage_banner' | 'centre_sponsor';
  product_target: string | null;
  business_id: number;
  business_name: string;
  business_slug: string;
  current_period_end: string | null;
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
export const businessPhotos = businessPhotosRaw as BusinessPhoto[];
export const sponsorships = sponsorshipsRaw as Sponsorship[];
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

const photosByBusinessId = new Map<number, BusinessPhoto[]>();
for (const photo of businessPhotos) {
  if (!photosByBusinessId.has(photo.business_id)) photosByBusinessId.set(photo.business_id, []);
  photosByBusinessId.get(photo.business_id)!.push(photo);
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

// Only ever meaningful to render when the business is CURRENTLY Featured
// (see FEATURED_TIER) — a downgraded business's rows stay in
// business_photos/R2 untouched, the page just stops showing them, so
// callers must still check business.subscription_tier themselves rather
// than assume a non-empty array means "show the gallery".
export function photosFor(business: Business): BusinessPhoto[] {
  return photosByBusinessId.get(business.id) ?? [];
}

const sponsorshipByKey = new Map<string, Sponsorship>();
for (const s of sponsorships) {
  sponsorshipByKey.set(`${s.product_type}:${s.product_target ?? ''}`, s);
}

/** The current sponsor of a slot, or `undefined` if it's open (never
 *  sold, or sold-but-expired as of the last rebuild). `target` is a
 *  category/suburb/shopping-centre slug, or omit it for the single
 *  homepage_banner slot. */
export function sponsorFor(productType: Sponsorship['product_type'], target?: string): Sponsorship | undefined {
  return sponsorshipByKey.get(`${productType}:${target ?? ''}`);
}

export function parseSourceUrls(business: Business): string[] {
  try {
    return JSON.parse(business.source_urls);
  } catch {
    return [];
  }
}
