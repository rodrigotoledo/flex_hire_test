require 'json'
require 'faker'
module Mock
  module Job
    def self.fake_data
      # Initialize a hash with the JSON structure
      fake_json = {
        "data": {
          "currentUser": {
            "jobs": [],
            "name": 'Rodrigo Toledo',
            "avatarUrl": "https://cdn.filestackcontent.com/cyvlkEf9TSiKCKFoLWvQ",
            "phone": "+5533991221596",
            "status": 'unverified'
          }
        }
      }
    
      # Populating job applications (jobs)
      jobs = Array.new(rand(3..5)).map do
        {
          "hiringManager": Faker::Name.name,  # Generate a fake hiring manager name
          "company": Faker::Company.name,  # Generate a fake company name
          "title": Faker::Job.title,  # Generate a fake job title
          "contractRequests": [
            {
              "screeningQuestions": Faker::Lorem.sentences(number: 2),  # Generate fake screening questions
              "codeTest": Faker::Lorem.sentence  # Generate a fake code test
            }
          ]
        }
      end
      fake_json[:data][:currentUser][:jobs] = jobs
      fake_json
    end
  end
end



