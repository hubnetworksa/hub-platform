import type { Site } from './site';

// Table-based layout with inline styles throughout, on purpose — the usual
// constraints for HTML email (many clients strip <style> blocks or ignore
// external/embedded CSS entirely), not an oversight.

export interface OwnerConfirmEmailData {
  businessName: string;
  address: string | null;
  phone: string | null;
  website: string | null;
  description: string;
  confirmUrl: string;
}

export function ownerConfirmEmailHtml(site: Site, data: OwnerConfirmEmailData): string {
  const t = site.theme;
  const bannerUrl = `https://${site.domain}${site.bannerImage}`;
  const logoUrl = `https://${site.domain}/logo-icon.png`;

  const rows = ([
    ['Business', data.businessName],
    ['Address', data.address],
    ['Phone', data.phone],
    ['Website', data.website],
  ] as const)
    .filter(([, v]) => v)
    .map(
      ([k, v]) => `<tr>
        <td style="padding:10px 16px;border-bottom:1px solid ${t.border};color:${t.textMuted};font-size:13px;font-weight:600;width:110px;vertical-align:top;">${k}</td>
        <td style="padding:10px 16px;border-bottom:1px solid ${t.border};color:${t.text};font-size:14px;">${escapeHtml(v as string)}</td>
      </tr>`
    )
    .join('');

  return `<!doctype html>
<html>
<body style="margin:0;padding:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${t.bgSubtle};padding:24px 0;">
    <tr>
      <td align="center">
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" style="background:${t.bgCard};border-radius:12px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.08);max-width:560px;">
          <tr>
            <td>
              <img src="${bannerUrl}" width="560" alt="${escapeHtml(site.siteName)}" style="display:block;width:100%;max-width:560px;height:160px;object-fit:cover;">
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 8px;">
              <img src="${logoUrl}" width="36" height="41" alt="" style="display:block;margin-bottom:12px;">
              <h1 style="margin:0 0 4px;font-size:20px;color:${t.navy};">Confirm your listing</h1>
              <p style="margin:0 0 20px;color:${t.textMuted};font-size:14px;line-height:1.5;">
                Someone submitted <strong style="color:${t.text};">${escapeHtml(data.businessName)}</strong> to ${escapeHtml(site.siteName)}. Before it goes live, please check the details below are correct.
              </p>
            </td>
          </tr>
          <tr>
            <td style="padding:0 32px;">
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid ${t.border};border-radius:8px;border-collapse:separate;">
                ${rows}
              </table>
              <p style="margin:16px 0 0;color:${t.text};font-size:14px;line-height:1.6;">${escapeHtml(data.description)}</p>
            </td>
          </tr>
          <tr>
            <td style="padding:28px 32px 32px;">
              <a href="${data.confirmUrl}" style="display:inline-block;background:${t.accent};color:${t.accentContrast};text-decoration:none;font-weight:700;font-size:15px;padding:12px 24px;border-radius:8px;">Review &amp; confirm listing →</a>
              <p style="margin:16px 0 0;color:${t.textMuted};font-size:12px;">If you didn't request this, you can safely ignore this email — nothing publishes without your confirmation.</p>
            </td>
          </tr>
        </table>
        <p style="margin:20px 0 0;color:${t.textMuted};font-size:12px;">${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)}</p>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}
