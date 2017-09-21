class State < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_set
end
