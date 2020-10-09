class Employee < ApplicationRecord
    has_many :links
    validates :fname, presence: true, length:{minimum:3}
    validates :lname, presence: true, length:{minimum:3}
end
