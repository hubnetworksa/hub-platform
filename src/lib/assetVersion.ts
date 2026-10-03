// Cache-busting URLs for the site's fixed-name brand files (logo, favicons,
// app icons). Their names never change, and browsers may keep them for hours,
// so a new logo would otherwise not show until those copies expire. The
// version is a hash of the file's contents, so it only changes when the file
// does: "/logo-icon.png" -> "/logo-icon.png?v=3f9c2a1b".
//
// Read at build time from public/, which select-site-assets.mjs fills with
// this site's files before every build.

import { createHash } from 'node:crypto';
import { readFileSync } from 'node:fs';
import path from 'node:path';

const versions = new Map<string, string>();

export function versioned(file: string): string {
  let v = versions.get(file);
  if (v === undefined) {
    try {
      v = createHash('sha1').update(readFileSync(path.join(process.cwd(), 'public', file))).digest('hex').slice(0, 8);
    } catch {
      v = ''; // file missing (e.g. config loaded outside a build): plain URL
    }
    versions.set(file, v);
  }
  return v ? `${file}?v=${v}` : file;
}
