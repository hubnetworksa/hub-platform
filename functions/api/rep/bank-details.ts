import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../../_lib/auth';
import { json, cleanText } from '../../_lib/messages';

interface Env {
  DB: D1Database;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'unauthorized' }, 401);
  const rep = await db.prepare('SELECT id FROM sales_reps WHERE user_id = ?').bind(user.id).first<{ id: number }>();
  if (!rep) return json({ ok: false, error: 'not_rep' }, 403);

  let body: Record<string, unknown>;
  try {
    body = (await context.request.json()) as Record<string, unknown>;
  } catch {
    return json({ ok: false, error: 'invalid_json' }, 400);
  }

  const bankName = cleanText(body.bankName, 80);
  if (!bankName) return json({ ok: false, error: 'bankName' }, 400);
  const accountHolder = cleanText(body.accountHolder, 80);
  if (!accountHolder) return json({ ok: false, error: 'accountHolder' }, 400);
  const accountNumber = typeof body.accountNumber === 'string' ? body.accountNumber.replace(/[\s-]/g, '') : '';
  if (!/^\d{6,20}$/.test(accountNumber)) return json({ ok: false, error: 'accountNumber' }, 400);
  const branchCode = typeof body.branchCode === 'string' ? body.branchCode.replace(/\s/g, '') : '';
  if (!/^\d{6}$/.test(branchCode)) return json({ ok: false, error: 'branchCode' }, 400);
  const accountType = body.accountType;
  if (accountType !== 'cheque' && accountType !== 'savings' && accountType !== 'transmission') return json({ ok: false, error: 'accountType' }, 400);
  if (body.consent !== true) return json({ ok: false, error: 'consent' }, 400);

  await db
    .prepare(
      `UPDATE sales_reps SET bank_name = ?, bank_account_holder = ?, bank_account_number = ?, bank_branch_code = ?, bank_account_type = ?, bank_consent_at = datetime('now')
       WHERE id = ?`
    )
    .bind(bankName, accountHolder, accountNumber, branchCode, accountType, rep.id)
    .run();
  return json({ ok: true });
};
