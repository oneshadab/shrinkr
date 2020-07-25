require 'digest'

class UrlController < ApplicationController
  def shrink
    url_digest = Digest::SHA2.hexdigest params[:url]
    url_guid = url_digest[0..3]

    new_url = url_for(
      :controller => 'url',
      :action => 'goto',
      :guid => url_guid,
    )

    new_url = _remove_prococol(new_url)
    render plain: new_url
  end

  def _remove_prococol(url)
    return url.split('://')[1..].join('://')
  end
end
