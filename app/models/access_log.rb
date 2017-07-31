class AccessLog < ApplicationRecord
  belongs_to :short_url

  def as_json options = {}
    {
      id: uuid,
      ip: ip,
      user_agent: user_agent,
      access_at: created_at
    }
  end
end
