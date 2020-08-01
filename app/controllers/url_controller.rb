class UrlController < ApplicationController
  include UrlHelper

  def shrink
    original_url = params[:url]
    url = Url.get_or_create(original: original_url)
    render plain: digest_to_url(url.digest)
  end

  def goto
    url = Url.find_by(digest: params[:digest])
    redirect_to(cleaned(url.original))
  end

  def digest_to_url(digest)
    shrunk_url = url_for(
      controller: 'url',
      action: 'goto',
      digest: digest
    )
    shrunk_url = remove_protocol(shrunk_url) # We don't need to keep the 'http://' prefix
    return shrunk_url
  end
end
