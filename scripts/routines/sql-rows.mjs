// Shared helpers for the routine SQL files in db/routine-updates/<city>/: split a file into
// statements, read the rows of an INSERT INTO <table> (...) VALUES (...)[, (...)], and check
// them against the table's NOT NULL columns.
//
// Why the NOT NULL check matters: the routines write INSERT OR IGNORE, and SQLite's OR IGNORE
// also skips a row that breaks a NOT NULL constraint, silently, while wrangler still reports
// success. So a NULL in one of these columns means the row just never appears on the site.
//
// NOT_NULL is the live schema (PRAGMA table_info) of all three cities' D1 databases, which
// match each other and db/migrations/<city>/ (*_events.sql, *_news.sql). Value: the column
// default to suggest, or null when the column has no default and must always be given.
// Columns the database fills itself (featured, source, created_at, ...) may be left out of
// the column list, but must never be written as an explicit NULL.

export const NOT_NULL = {
  events: {
    slug: null, title: null, type: 'Music', event_date: null,
    price: 'Price TBC', ticket_url: '#', description: '',
    featured: '0', source: 'admin', created_at: "datetime('now')", updated_at: "datetime('now')",
  },
  news: {
    slug: null, title: null, category: 'Community', published_date: null,
    source_name: null, source_url: null, summary: null, body: null,
    verification_json: '[]', source: 'agent', created_at: "datetime('now')",
  },
};

export function stripComments(raw) {
  return raw.replace(/\r\n/g, '\n').split('\n').filter((l) => !/^\s*--/.test(l)).join('\n');
}

export function splitStatements(s) {
  const out = [];
  let cur = '', q = false;
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "'") { if (q && s[i + 1] === "'") { cur += "''"; i++; continue; } q = !q; }
    if (c === ';' && !q) { if (cur.trim()) out.push(cur.trim()); cur = ''; continue; }
    cur += c;
  }
  if (cur.trim()) out.push(cur.trim());
  return out;
}

// Split on commas that are outside quotes and brackets.
export function splitTop(s) {
  const out = [];
  let cur = '', q = false, depth = 0;
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "'") { if (q && s[i + 1] === "'") { cur += "''"; i++; continue; } q = !q; }
    if (!q) { if (c === '(') depth++; if (c === ')') depth--; }
    if (c === ',' && !q && depth === 0) { out.push(cur.trim()); cur = ''; continue; }
    cur += c;
  }
  if (cur.trim()) out.push(cur.trim());
  return out;
}

export const unq = (v) => (v == null ? null : /^NULL$/i.test(v) ? null : v.startsWith("'") && v.endsWith("'") ? v.slice(1, -1).replace(/''/g, "'") : v);

// Every row a statement inserts into `table`: [{ cols, vals, row }] (row = column -> unquoted
// value, SQL NULL -> null). Returns null when the statement is not an INSERT INTO `table`.
export function insertRows(stmt, table) {
  const m = stmt.match(new RegExp(`^INSERT\\s+(?:OR\\s+\\w+\\s+)?INTO\\s+${table}\\s*\\(([\\s\\S]*?)\\)\\s*VALUES\\s*([\\s\\S]*)$`, 'i'));
  if (!m) return null;
  const cols = m[1].split(',').map((c) => c.trim());
  return splitTop(m[2]).map((tuple) => {
    const vals = splitTop(tuple.trim().replace(/^\(/, '').replace(/\)$/, ''));
    return { cols, vals, row: Object.fromEntries(cols.map((c, i) => [c, unq(vals[i])])) };
  });
}

// Messages for every NOT NULL column of `table` that this row sets to NULL, or leaves out when
// the column has no default.
export function notNullProblems(row, table, label = row.slug ?? '(no slug)') {
  const out = [];
  for (const [col, dflt] of Object.entries(NOT_NULL[table])) {
    const present = Object.prototype.hasOwnProperty.call(row, col);
    if (present ? row[col] === null : dflt === null) {
      const hint = dflt === null ? '' : dflt.startsWith('datetime') ? ' (leave it out of the column list and the database fills it in)' : ` (use '${dflt}' if unknown)`;
      out.push(`${label}: ${col} is NULL but the ${table} table requires a value${hint}`);
    }
  }
  return out;
}
