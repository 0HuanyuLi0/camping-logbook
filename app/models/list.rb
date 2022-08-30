class List < ApplicationRecord
    belongs_to :user, optional:true
    validates :title, presence:true
    has_many :photos, :dependent => :destroy
    has_many :stories,:dependent => :destroy
    has_and_belongs_to_many :sites
end
