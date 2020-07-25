require 'digest'

class UrlController < ApplicationController
  def shrink
    original_url = params[:url]
    url_digest = Digest::SHA2.hexdigest original_url
    shrunk_url = url_digest[0..3]

    # Url.create(original: original_url, shrunk: shrunk_url)

    render plain: _shrunk_url_for(shrunk_url)
  end

  def _shrunk_url_for(url_guid)
    new_url = url_for(
      :controller => 'url',
      :action => 'goto',
      :guid => url_guid,
    )

    new_url = _remove_prococol(new_url)
    return new_url
  end

  def _remove_prococol(url)
    return url.split('://')[1..].join('://')
  end
end
