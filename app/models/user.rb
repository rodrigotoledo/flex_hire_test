class User < ApplicationRecord
  validates :data, presence: true
  def self.return_current
    begin
      data = Api::User.data
      data.blank? ? User.last : User.create(data: data)
    rescue => exception
      logger.info "exception while creating User: #{exception.message}"
      User.last || nil
    end
  end
end
