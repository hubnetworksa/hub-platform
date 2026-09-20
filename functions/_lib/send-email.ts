// Sends via Resend (https://resend.com) when this Pages project has a
// RESEND_API_KEY secret set (Settings → Environment variables, or
// `wrangler pages secret put RESEND_API_KEY --project-name=<name>`) — one
// Resend account, one key, shared across sites, each verifying its own
// domain there so it can send `from` its own hello@<domain> address (see
// sites/<slug>.json's contactEmail). Returns { sent: false } rather than
// throwing when the key isn't set yet, so a site without Resend configured
// keeps working: callers save the data first and treat the email as a
// best-effort notification on top.
export interface SendEmailOptions {
  from: string;
  to: string;
  subject: string;
  text: string;
  /** Optional rich version — Resend sends this when present, with `text`
   *  kept as the fallback for clients that don't render HTML. */
  html?: string;
  /** Where the recipient's "Reply" goes — e.g. the visitor who filled in a form. */
  replyTo?: string;
}

export async function sendEmail(
  env: { RESEND_API_KEY?: string },
  opts: SendEmailOptions
): Promise<{ sent: boolean }> {
  if (!env.RESEND_API_KEY) return { sent: false };

  try {
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
        ...(opts.html ? { html: opts.html } : {}),
        ...(opts.replyTo ? { reply_to: opts.replyTo } : {}),
      }),
    });

    if (!res.ok) console.error('Resend send failed', res.status, await res.text());
    return { sent: res.ok };
  } catch (err) {
    console.error('Resend send threw', err);
    return { sent: false };
  }
}
