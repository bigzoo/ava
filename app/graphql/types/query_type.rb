Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An query example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World of queries!"
    }
  end

  field :reminder do
    type ReminderType
    description 'The reminder associated with a given token'
    argument :token, !types.String
    resolve -> (obj, args, ctx) { Reminder.where(session_token:args[:token]).last }
  end
end
