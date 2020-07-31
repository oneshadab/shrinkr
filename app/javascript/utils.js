import validUrl from 'valid-url';

function isValidUrl(url) {
  return [
    url,
    `http://${url}`,
  ].some(url => validUrl.isWebUri(url));
}

export default {
  isValidUrl
}
