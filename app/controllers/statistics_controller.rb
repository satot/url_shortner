class StatisticsController < ApplicationController
  before_action :find_short_url

  def show
    if @short_url
      render json: stats_json_format
    else
      not_found
    end
  end

  private
  def find_short_url
    @short_url = ShortUrl.find_by(identifier: params[:id])
  end

  def stats_json_format
      {
        count: @short_url.access_log.count,
        logs: @short_url.access_log
      }
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
