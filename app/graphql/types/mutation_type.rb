Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :testField, types.String do
    description "An example Mutation field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World of Mutations!"
    }
  end
end
