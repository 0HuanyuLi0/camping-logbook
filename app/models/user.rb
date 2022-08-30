class User < ApplicationRecord

    
    validates :name, length: {minimum:2}
    validates :email, presence:true, uniqueness:true, confirmation: { case_sensitive: false }
    
    has_secure_password

    has_many :lists

end
