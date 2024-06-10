class Course < ApplicationRecord
    has_many :tutors, dependent: :destroy
    accepts_nested_attributes_for :tutors, allow_destroy: true
    validates :name, presence: true, uniqueness: true
end
