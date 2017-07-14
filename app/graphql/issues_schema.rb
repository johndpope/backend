SourcerSchema = GraphQL::Schema.define do
  authorization(:cancan)
  query(Types::QueryType)
end
