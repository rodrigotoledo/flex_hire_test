namespace :graphql do
  desc 'Export GraphQL schema to JSON'
  task :export_schema do
    query = File.read(Rails.root.join('config/schema.graphql'))
    schema = GraphQL::Schema.from_definition(query)
    File.open(Rails.root.join('config/schema.json'), 'w') do |file|
      file.write(schema.to_json)
    end
  end
end
