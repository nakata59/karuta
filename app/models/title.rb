class Title < ApplicationRecord
    has_many :Karutums, dependent: :destroy
end
