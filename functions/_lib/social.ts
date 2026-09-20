// Social page links a Featured business can add. Each must be an https link to
// the matching network, so the field can't be used to link somewhere else.
export const SOCIAL_KINDS = ['instagram', 'facebook', 'linkedin', 'youtube'] as const;
export type SocialKind = (typeof SOCIAL_KINDS)[number];

const HOSTS: Record<SocialKind, string[]> = {
  instagram: ['instagram.com'],
  facebook: ['facebook.com', 'fb.com'],
  linkedin: ['linkedin.com'],
  youtube: ['youtube.com', 'youtu.be'],
};

/** Empty -> null (clears the link); a valid link -> the cleaned https URL; anything else -> undefined. */
export function normalizeSocial(kind: SocialKind, raw: unknown): string | null | undefined {
  if (raw === undefined || raw === null) return null;
  if (typeof raw !== 'string') return undefined;
  let v = raw.trim();
  if (!v) return null;
  if (v.length > 200) return undefined;
  if (!/^https?:\/\//i.test(v)) v = `https://${v}`;
  let u: URL;
  try {
    u = new URL(v);
  } catch {
    return undefined;
  }
  const host = u.hostname.toLowerCase().replace(/^(www|m|web)\./, '');
  if (!HOSTS[kind].some((h) => host === h || host.endsWith(`.${h}`))) return undefined;
  if (u.pathname.replace(/\//g, '').length === 0) return undefined; // the bare site, not a page
  u.protocol = 'https:';
  u.hash = '';
  return u.toString();
}

export const SOCIAL_LABELS: Record<SocialKind, string> = {
  instagram: 'Instagram',
  facebook: 'Facebook',
  linkedin: 'LinkedIn',
  youtube: 'YouTube',
};
