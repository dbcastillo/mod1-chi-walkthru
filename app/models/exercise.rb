class Exercise< ActiveRecord::Base 
    has_many :exercise_plans
    has_many :users, through: :exercise_plans
end