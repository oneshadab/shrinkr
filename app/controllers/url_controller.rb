class UrlController < ApplicationController
  include UrlHelper

  def shrink
    original_url = params[:url]
    url = Url.get_or_create(original: original_url)
    render plain: shrunk_url_of(url)
  end

  def goto
    url = Url.find_by(digest: params[:digest])
    redirect_to(cleaned(url.original))
  end

  def shrunk_url_of(url)
    shrunk_url = url_for(controller: 'url', action: 'goto', digest: url.digest)
    shrunk_url = remove_protocol(shrunk_url)
    return shrunk_url
  end
end
