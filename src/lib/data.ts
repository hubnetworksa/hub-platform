import suburbsRaw from '../data/suburbs.json';
import categoriesRaw from '../data/categories.json';
import businessesRaw from '../data/businesses.json';
import businessCategoriesRaw from '../data/business-categories.json';
import shoppingCentersRaw from '../data/shopping-centers.json';
import businessPhotosRaw from '../data/business-photos.json';
import { dailyShuffle } from './rotation';

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
  /** 0 = Free, 1 = Verified (R50), 2 = Verified Plus (R99), 3 = Featured (R199), 4 = Premium (R299) — see the Premium Listings plan. */
  subscription_tier: number;
  subscription_status: string | null;
  subscription_expires_at: string | null;
  template_id: 'classic' | 'gallery' | 'services';
  /** JSON-encoded CustomBlock[] — Premium only, parse with customBlocksFor(). */
  custom_blocks: string | null;
}

export interface CustomBlock {
  type: 'story' | 'specials' | 'team' | 'gallery';
  title: string;
  body: string;
}

export function customBlocksFor(business: Business): CustomBlock[] {
  if (!business.custom_blocks) return [];
  try {
    const parsed = JSON.parse(business.custom_blocks);
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

export interface BusinessPhoto {
  id: number;
  business_id: number;
  r2_key: string;
  sort_order: number;
  caption: string | null;
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
const businessCategories = businessCategoriesRaw as BusinessCategoryLink[];

export const TIER_VERIFIED = 1;
export const TIER_VERIFIED_PLUS = 2;
export const TIER_FEATURED = 3;
export const TIER_PREMIUM = 4;

const photosByBusinessId = new Map<number, BusinessPhoto[]>();
for (const photo of businessPhotos) {
  if (!photosByBusinessId.has(photo.business_id)) photosByBusinessId.set(photo.business_id, []);
  photosByBusinessId.get(photo.business_id)!.push(photo);
}
export const photosFor = (business: Business) => photosByBusinessId.get(business.id) ?? [];

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

function tierBand(list: Business[], tier: number, seed: string): Business[] {
  return dailyShuffle(
    list.filter((b) => b.subscription_tier === tier && b.subscription_status === 'active'),
    seed,
    (b) => b.id
  );
}

// Promoted bands for a listing page: Premium's "Top Spot" always sits above
// Featured's strip, which always sits above the plain list — see the plan's
// "fair rotation" section for why *within* a tier the order is a daily
// shuffle rather than "whoever subscribed first".
export const topSpotInCategory = (categoryId: number) => tierBand(businessesInCategory(categoryId), TIER_PREMIUM, `category:${categoryId}`);
export const featuredInCategory = (categoryId: number) => tierBand(businessesInCategory(categoryId), TIER_FEATURED, `category:${categoryId}`);
export const topSpotInSuburb = (suburbId: number) => tierBand(businessesInSuburb(suburbId), TIER_PREMIUM, `suburb:${suburbId}`);
export const featuredInSuburb = (suburbId: number) => tierBand(businessesInSuburb(suburbId), TIER_FEATURED, `suburb:${suburbId}`);

// Homepage "Featured businesses" section — across every category, not
// scoped to one. Capped by the caller; the whole site's Premium+Featured
// roster could exceed what belongs on a homepage.
export const topSpotSitewide = () => tierBand(businesses, TIER_PREMIUM, 'sitewide');
export const featuredSitewide = () => tierBand(businesses, TIER_FEATURED, 'sitewide');

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
