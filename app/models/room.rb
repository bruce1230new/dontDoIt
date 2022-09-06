class Room < ApplicationRecord
    has_many :players
    validates :room_name, presence: true, length:{ minimum: 1, maximum: 30}
end