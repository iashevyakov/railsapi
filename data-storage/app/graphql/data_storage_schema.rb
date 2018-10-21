require 'types/mutation_type'
require 'types/base_scalar'


class DataStorageSchema < GraphQL::Schema
  # mutation(Types::MutationType)
  query(Types::QueryType)
end
