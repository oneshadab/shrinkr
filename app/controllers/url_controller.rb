require 'digest'

class UrlController < ApplicationController
  def shrink
    original_url = params[:url]
    url_digest = Digest::SHA2.hexdigest original_url
    shrunk_guid = url_digest[0..3]

    Url.create(original: original_url, shrunk: shrunk_guid)

    render plain: _shrunk_url_for(shrunk_guid)
  end

  def goto
    url = Url.find_by(shrunk: params[:guid])
    redirect_to(url.original)
  end


  def _shrunk_url_for(url_guid)
    new_url = url_for(
      :controller => 'url',
      :action => 'goto',
      :guid => url_guid,
    )

    new_url = _remove_protocol(new_url)
    return new_url
  end

  def _set_protocol(url, protocol)
    return protocol + "://" + _remove_protocol(url) # Remove any existing protocols
  end


  def _remove_protocol(url)
    if !_has_protocol(url)
      return url
    end

    return url.split('://')[1..].join('://')
  end

  def _has_protocol(url)
    return url.split('://').length > 1
  end

end
