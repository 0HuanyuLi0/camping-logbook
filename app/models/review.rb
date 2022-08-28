class Review < ApplicationRecord
    belongs_to :site,optional: true
end
