class Client < ApplicationRecord
    has_one :account, as: :accountable
end
