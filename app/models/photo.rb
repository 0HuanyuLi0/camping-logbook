class Photo < ApplicationRecord
    belongs_to :site,optional: true

    validates :link, presence:true, uniqueness:true
    
end
