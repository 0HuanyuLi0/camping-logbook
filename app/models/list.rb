class List < ApplicationRecord
    belongs_to :user, optional:true
    validates :title, presence:true

    has_and_belongs_to_many :sites
end
