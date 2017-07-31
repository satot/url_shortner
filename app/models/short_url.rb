class ShortUrl < ApplicationRecord
  validates :url, presence: true, format: URI.regexp(/\A(?i)https?/)
  has_many :access_log

  before_create :set_identifier

  attr_readonly :identifier

  class << self
    BASE62 = [*"0".."9", *"a".."z", *"A".."Z"]
    NUM_OF_CHARS = 6 # 62**6 ~ 56 billion
    RETRY_COUNT = 5

    def generate_identifier limit = RETRY_COUNT
      return if limit.zero?
      id = ""
      NUM_OF_CHARS.times{id << BASE62.sample}
      exists?(identifier: id) ? generate_identifier(limit.pred) : id
    end
  end

  private
  def set_identifier
    if (identifier = self.class.generate_identifier)
      self.identifier = identifier
    else
      errors.add(:base, "cannot create")
      return false
    end
  end
end
