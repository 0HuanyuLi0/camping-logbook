class Photo < ApplicationRecord
    belongs_to :site,optional: true
end
