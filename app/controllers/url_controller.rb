class UrlController < ApplicationController
  def shrink
    @url = params[:url]
  end
end
