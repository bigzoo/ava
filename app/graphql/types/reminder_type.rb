Types::ReminderType = GraphQL::ObjectType.define do
  name "Reminder"
  field :date, types.String
  field :time, types.String
  field :name, types.String
  field :recurrence, types.String
  field :user_id, types.String
  field :session_token, types.String
end
