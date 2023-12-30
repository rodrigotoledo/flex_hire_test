class Job < ApplicationRecord
  validates :data, presence: true
  def self.return_current
    begin
      jobs_data = Api::User.jobs
      jobs_data.blank? ? Job.last : Job.create(data: jobs_data)
    rescue => exception
      logger.info "exception while creating job: #{exception.message}"
      Job.last
    end
  end
end
