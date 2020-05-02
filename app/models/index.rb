class Index < ApplicationRecord
    belongs_to :exchange
    has_and_belongs_to_many :stocks
end
