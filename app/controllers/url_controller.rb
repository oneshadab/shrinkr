require 'digest'

class UrlController < ApplicationController
  def shrink
    url_hash = Digest::SHA2.hexdigest params[:url]
    url_hash_prefix = url_hash.to_s[0..3]

    new_url = url_for(
      :controller => 'url',
      :action => 'redirect',
      :url => url_hash_prefix
    )

    render plain: new_url
  end
end
