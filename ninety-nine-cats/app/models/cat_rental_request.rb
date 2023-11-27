class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: {in: %w(APPROVED DENIED PENDING)}, presence:true
    validates :start_date, presence:true
    validates :end_date, presence:true
    validates :cat_id, presence:true

    belongs_to :cat
    


end
