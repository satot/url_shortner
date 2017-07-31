class RedirectController < ApplicationController
  before_action :find_short_url

  def show
    if @short_url
      store_access_log
      redirect_to @short_url.url, status: :moved_permanently
    else
      not_found
    end
  end

  private
  def find_short_url
    @short_url = ShortUrl.find_by(identifier: params[:id])
  end

  def store_access_log
    log = AccessLog.new(
      short_url_id: @short_url.id,
      ip: request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip,
      user_agent:  request.user_agent,
      uuid: SecureRandom.uuid
    )
    log.save!
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
