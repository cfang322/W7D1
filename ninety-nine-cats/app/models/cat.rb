require "action_view"

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ["brown", "black", "orange"]
    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: {in: CAT_COLORS}
    validates :name, presence: true
    validates :sex, presence: :true, inclusion: {in: ["M", "F"]}

    def birth_date_cannot_be_future 
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "cannot be in the future")
        end
    end 

    def age #use birth_date to calc. age
        return unless birth_date.present?
        time_ago_in_words(birth_date)
    end
end
