class Proposal < ActiveRecord::Base
    belongs_to :note
    belongs_to :user
    
    validates :model, presence: true
    validates :quantity, presence: true, format: { with: /\A[0-9]+\z/i }
    validates :price, presence: true, format: { with: /\A[0-9]+\z/i }
    
end
