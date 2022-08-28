class Site < ApplicationRecord
    has_many :photos, :dependent => :destroy
    has_many :reviews, :dependent => :destroy
    accepts_nested_attributes_for :photos,:reject_if => lambda { |a| a[:link].blank? }, :allow_destroy => true
end