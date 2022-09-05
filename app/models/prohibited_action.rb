class ProhibitedAction < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length:{ minimum: 1, maximum: 30}
end