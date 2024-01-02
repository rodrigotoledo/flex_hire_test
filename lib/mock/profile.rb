require 'json'
require 'faker'
module Mock
  module Profile
    def self.fake_data
      # Initialize a hash with the JSON structure
      fake_json = {
        "data": {
          "currentUser": {
            "name": 'Rodrigo Toledo',
            "avatarUrl": "https://cdn.filestackcontent.com/cyvlkEf9TSiKCKFoLWvQ",
            "phone": "+5533991221596",
            "userSkills": [],
            "status": 'unverified',
            "emailSubscriptions": [],
            "answers": [],
            "lastSync": I18n.l(Time.now, format: :short)
          }
        }
      }

      # Populating userSkills
      skills = ["Requirements Gathering", "Management", "React", "Ruby on Rails", "Javascript", "Ruby", "GraphQL"]
      fake_json[:data][:currentUser][:userSkills] = skills.map do |skill|
        {
          "experience": rand(4),  # Generate a random experience from 0 to 3
            "skill": {
            "name": skill
          }
        }
      end

      # Populating emailSubscriptions
      subscription_names = ["referral_opportunity", "job_opportunity", "freelancer_incomplete"]
      fake_json[:data][:currentUser][:emailSubscriptions] = subscription_names.map do |subscription_name|
        {
          "subscriptionName": subscription_name
        }
      end

      # Populating answers
      fake_json[:data][:currentUser][:answers] = Array.new(4).map do
        {
          "optimizedUrl": Faker::Internet.url  # Generate a fake URL
        }
      end

      fake_json
    end
  end
end