require 'graphql/client'
require 'graphql/client/http'
module Api
  class User
    def self.graphql_client
      schema_file = Rails.root.join('config/schema.json')
      schema_content = File.read(schema_file)
      schema = GraphQL::Client.load_schema(schema_content)

      http_client = GraphQL::Client::HTTP.new(ENV.fetch('FLEXHIRE_URI')) do
        def headers(context)
          {
            'FLEXHIRE-API-KEY' => ENV.fetch('FLEXHIRE_API_KEY')
          }
        end
      end
      GraphQL::Client.new(schema: schema, execute: http_client)
    end
    
    def self.profile
      return Mock::Profile.fake_data
      # TODO: I have problems to get data in the api endpoint
      # graphql_client = Api::User.graphql_client
      # query = graphql_client.parse(File.read('app/graphql/queries/profile_query.graphql'))
      # graphql_client.query(query)
    end

    def self.jobs
      return Mock::Job.fake_data
      # TODO: I have problems to get data in the api endpoint
      # graphql_client = Api::User.graphql_client
      # query = graphql_client.parse(File.read('app/graphql/queries/jobs_query.graphql'))
      # graphql_client.query(query)
    end
  end
end