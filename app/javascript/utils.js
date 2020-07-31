import validUrl from 'valid-url';

function isValidUrl(url) {
  return validUrl.isWebUri(url);
}

export default {
  isValidUrl
}
