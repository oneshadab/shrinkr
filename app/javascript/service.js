import axios from 'axios';

const apiBase = '/api/';

async function shrinkUrl(url) {
  const res = await axios.post(`${apiBase}/shrink/`, { url });
  return res.data;
}

export default {
  shrinkUrl
}
