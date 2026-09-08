#!/usr/bin/env node
// Wraps `wrangler d1 migrations apply` with this SITE's own db name and
// wrangler config — kept as a script (rather than inline in package.json)
// so it works the same from PowerShell, cmd.exe, and bash without relying
// on shell-specific env-var syntax.

import { execFileSync } from 'node:child_process';
import { readFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const SITE = process.env.SITE;
if (!SITE) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane npm run db:migrate:local`.');
}
const mode = process.argv.includes('--remote') ? '--remote' : '--local';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const site = JSON.parse(await readFile(path.join(ROOT, 'sites', `${SITE}.json`), 'utf8'));
const WRANGLER_JS = path.join(ROOT, 'node_modules', 'wrangler', 'bin', 'wrangler.js');
const WRANGLER_CONFIG = path.join(ROOT, `wrangler.${SITE}.jsonc`);

execFileSync(
  process.execPath,
  [WRANGLER_JS, 'd1', 'migrations', 'apply', site.dbName, '--config', WRANGLER_CONFIG, mode],
  { stdio: 'inherit' }
);
