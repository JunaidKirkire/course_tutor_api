class Tutor < ApplicationRecord
    belongs_to :course
    validates :name, presence: true, uniqueness: true
    validates :course, presence: true
end
