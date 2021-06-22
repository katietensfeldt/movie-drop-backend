class SuggestionSerializer < ActiveModel::Serializer
  attributes :id, :movie, :watched, :sender, :recipient
end
