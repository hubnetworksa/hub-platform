// The IndexNow key shared by all three sites (https://www.indexnow.org).
// Not a secret: search engines verify it by fetching https://<domain>/<key>.txt,
// which select-site-assets.mjs writes into public/ for whichever site is being
// built. Changing it just means the next submission re-verifies the new file.
export const INDEXNOW_KEY = '76d00ffba33948a785c12debbb5c7a09';
