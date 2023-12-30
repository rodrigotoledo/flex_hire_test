class Profile < ApplicationRecord
  validates :data, presence: true
  def self.return_current
    begin
      profile_data = Api::User.profile
      profile_data.nil? ? Profile.last : Profile.create(data: profile_data)
    rescue => exception
      logger.info "exception while creating profile: #{exception.message}"
      Profile.last
    end
  end
end
