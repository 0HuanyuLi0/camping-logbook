class Site < ApplicationRecord
    has_many :photos, :dependent => :destroy
    has_many :reviews, :dependent => :destroy

    validates :name, length: {minimum:2}, uniqueness:true

    has_and_belongs_to_many :lists
end
