class UrlController < ApplicationController
  def shrink
    @url = params[:url] + 'done!'
    render plain: @url
  end
end
