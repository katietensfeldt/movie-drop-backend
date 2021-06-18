class SuggestionSerializer < ActiveModel::Serializer
  attributes :id, :movie, :watched

  belongs_to :sender
  belongs_to :recipient
end
