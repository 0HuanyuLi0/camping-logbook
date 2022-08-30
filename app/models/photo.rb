class Photo < ApplicationRecord
    belongs_to :site,optional: true
    belongs_to :user,optional: true
    belongs_to :list,optional: true

    validates :link, presence:true
    # uniqueness:true

end
