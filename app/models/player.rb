class Player < ApplicationRecord
    belongs_to :room
    belongs_to :prohibited_action
end