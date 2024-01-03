require 'graphql/client'
require 'graphql/client/http'

module Api
  class User
    HTTP_CLIENT = GraphQL::Client::HTTP.new(ENV.fetch('FLEXHIRE_URI')) do
      def headers(context)
        { 'FLEXHIRE-API-KEY' => ENV.fetch('FLEXHIRE_API_KEY') }
      end
    end

    SCHEMA_LOADER = GraphQL::Client.load_schema(File.read(Rails.root.join('config/schema.json')))
    CLIENT = GraphQL::Client.new(schema: SCHEMA_LOADER, execute: HTTP_CLIENT)

    QUERY = CLIENT.parse(File.read(Rails.root.join('app/graphql/queries/query.graphql')))

    def self.data
      result = CLIENT.query(QUERY)

      raise "Error in GraphQL query: #{result.errors}" if result.errors.any?

      # TODO: should use data but the return its something like currentUser without allJobs and other fields
      # result.data
      result.original_hash['data']
    end
  end
end