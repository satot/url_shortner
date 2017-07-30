class RedirectController < ApplicationController
  before_action :find_short_url

  def show
    if @short_url
      redirect_to @short_url.url, status: :moved_permanently
    else
      not_found
    end
  end

  private
  def find_short_url
    @short_url = ShortUrl.find_by(identifier: params[:id])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
