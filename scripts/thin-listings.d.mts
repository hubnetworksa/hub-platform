export declare const THIN_DESCRIPTION_CHARS: number;
export declare function isThinListing(
  b: { subscription_tier?: number | null; owner_user_id?: number | null; description?: string | null; hours?: string | null; website?: string | null },
  approvedReviews: number
): boolean;
