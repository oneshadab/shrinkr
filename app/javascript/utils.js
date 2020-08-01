import validUrl from 'valid-url';

function isValidUrl(url) {
  const regexString = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$";
  const urlRegex = new RegExp(regexString,"i");
  return urlRegex.test(url);
}

export default {
  isValidUrl
}
