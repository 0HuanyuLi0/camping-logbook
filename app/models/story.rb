class Story < ApplicationRecord

    belongs_to :site,optional: true
    belongs_to :user,optional: true
    belongs_to :list,optional: true

    validates :title, presence:true


end
