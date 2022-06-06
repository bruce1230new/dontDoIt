class Room < ApplicationRecord
    validates :room_name, presence: true, length:{ minimum: 1, maximum: 30}
end