class User < ApplicationRecord    
    
    has_many :rigs, dependent: :destroy
    has_many :items, :through => :rigs
    
    enum role: [:user, :moderator, :admin]
    
    has_secure_password
    validates :first_name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true
    validates :password, :confirmation => true
#    validates :password_confirmation, :presence => true
    
    def my_equipment
        items.uniq 
    end
    def name
        return "#{first_name} #{last_name}".strip 
    end
end
