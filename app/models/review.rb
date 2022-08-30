class Review < ApplicationRecord
    belongs_to :site,optional: true
    belongs_to :user,optional: true
end
