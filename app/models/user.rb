class User < ActiveRecord::Base
    has_many :exercise_plans
    has_many :exercises, through: :exercise_plans
end