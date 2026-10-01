import siteSettingsRaw from '../data/site-settings.json';
import site from '../site';

// Build-time overrides edited on the admin "Site settings" and "Ads &
// sponsors" tabs. They live in the `site_settings` key/value table and are
// snapshotted into src/data/site-settings.json by scripts/fetch-d1-data.mjs,
// so they take effect on the next rebuild ("Rebuild & deploy"). Anything
// left unset falls back to this site's own config (src/site.ts).

const settings = new Map((siteSettingsRaw as { key: string; value: string }[]).map((r) => [r.key, r.value]));

function text(key: string, fallback: string): string {
  const v = settings.get(key);
  return v && v.trim() ? v.trim() : fallback;
}

/** Site name (e.g. "TheCapeTownHub") — override of `site.siteName`. */
export const siteName = text('site_name', site.siteName);
/** City label (e.g. "Cape Town") — override of `site.cityLabel`. */
export const cityLabel = text('site_city_label', site.cityLabel);
/** Footer tagline — override of `site.footerTagline`. */
export const footerTagline = text('site_footer_tagline', site.footerTagline);
/** Global display-ads switch from the Ads & sponsors tab. On unless explicitly switched off. */
export const adsEnabled = settings.get('ads_enabled') !== '0';

/** Raw cents for a rate-card key, or null if it isn't configured. */
export function settingCents(key: string): number | null {
  const n = Number(settings.get(key));
  return settings.has(key) && Number.isFinite(n) ? n : null;
}

export const siteOverrides = { siteName, cityLabel, footerTagline, adsEnabled };
