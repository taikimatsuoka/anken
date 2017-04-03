class Proposal < ActiveRecord::Base
    belongs_to :note
    belongs_to :user
    
    validates :model,  presence: true
    validates :quantity,     presence: true
    validates :price,      presence: true
    
end
