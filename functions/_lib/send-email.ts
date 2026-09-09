// Sends via Resend (https://resend.com) when this Pages project has a
// RESEND_API_KEY secret set (Settings → Environment variables, or
// `wrangler pages secret put RESEND_API_KEY --project-name=<name>`) — one
// Resend account, one key, shared across sites, each verifying its own
// domain there so it can send `from` its own hello@<domain> address (see
// sites/<slug>.json's contactEmail). Returns { sent: false } rather than
// throwing when the key isn't set yet, so a site without Resend configured
// can fall back to the mailto: approach instead of hard-failing.
export interface SendEmailOptions {
  from: string;
  to: string;
  subject: string;
  text: string;
}

export async function sendEmail(
  env: { RESEND_API_KEY?: string },
  opts: SendEmailOptions
): Promise<{ sent: boolean }> {
  if (!env.RESEND_API_KEY) return { sent: false };

  const res = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${env.RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: opts.from,
      to: [opts.to],
      subject: opts.subject,
      text: opts.text,
    }),
  });

  return { sent: res.ok };
}
