class UrlController < ApplicationController
  include UrlHelper

  def shrink
    original_url = params[:url]
    digest = generate_digest(original_url)

    url = Url.create(original: original_url, digest: digest)
    render plain: digest_to_url(url.digest)
  end

  def goto
    url = Url.find_by(digest: params[:digest])
    redirect_to(cleaned(url.original))
  end

  def digest_to_url(digest)
    shrunk_url = url_for(controller: 'url', action: 'goto', digest: digest)
    shrunk_url = remove_protocol(shrunk_url)
    return shrunk_url
  end
end
