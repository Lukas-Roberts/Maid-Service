class Maid < ApplicationRecord
    has_one :account, as: :accountable
end
