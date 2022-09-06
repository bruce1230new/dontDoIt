class Player < ApplicationRecord
    belongs_to :room
    belongs_to :prohibited_action

    validates :name, presence: true, length:{ minimum: 1, maximum: 30}
    validates :room_id, presence: true
    validates :prohibited_action_id, presence: true
    validates :lives, presence: true
end