class Exercise< ActiveRecord::Base 
    has_many :exercise_plans
    has_many :users, through: :exercise_plans

    def self.find_exercise(exercise_name)
        #self.all.select {|workout| workout.name == exercise_name}
        self.find_by(name: exercise_name)
    end

    def self.add_exercise(current_user)
        exercises = Exercise.all.map {|exercise| exercise.name}
        prompt = TTY::Prompt.new
        users_input = prompt.select("Choose One", exercises)
        case users_input 
        when "run-the-rack"
            exercise = "run-the-rack"
            exercise_object = Exercise.find_exercise(exercise)
            ExercisePlan.create(user_id: current_user.id, exercise_id: exercise_object.id)
            system "clear"
            puts "#{exercise} has been added to your list!"
            sleep(3,)
            system "clear"
        when "military-press"
            exercise = "military-press"
            exercise_object = Exercise.find_exercise(exercise)
            ExercisePlan.create(user_id: current_user.id, exercise_id: exercise_object.id)
            system "clear"
            puts "#{exercise} has been added to your list!"
            sleep(3,)
            system "clear"
        when "vma-hit"
            exercise = "vma-hit"
            exercise_object = Exercise.find_exercise(exercise)
            ExercisePlan.create(user_id: current_user.id, exercise_id: exercise_object.id)
            system "clear"
            puts "#{exercise} has been added to your list!"
            sleep(3,)
            system "clear"
        when "bicep-twentys"
            exercise = "bicep-twentys"
            exercise_object = Exercise.find_exercise(exercise)
            ExercisePlan.create(user_id: current_user.id, exercise_id: exercise_object.id)
            system "clear"
            puts "#{exercise} has been added to your list!"
            sleep(3,)
            system "clear"
        end
    end

    def self.see_exercises(current_user)
        unless ExercisePlan.all.any? {|plan| plan.user_id == current_user.id}
            system "clear"
            puts "You have no exercises, please add an exercise"
            sleep(3,)
            system "clear"
        else
            users_exercise_plans = ExercisePlan.where(user_id: current_user.id)
            exercise_ids = users_exercise_plans.map {|exercise| exercise.exercise_id}
            system "clear"
            exercise_ids.map do |number|
            exercise = Exercise.find(number).name
            puts exercise
            end
            sleep(3,)
            system "clear"
        end
    end

    def self.delete_exercise(current_user)
        exercises = Exercise.all.map {|exercise| exercise.name}
        prompt = TTY::Prompt.new
        system "clear"
        users_input = prompt.select("Choose exercise to remove from your list", exercises)
        case users_input
        when "run-the-rack"
            users_id = current_user.id
            exercise = "run-the-rack"
            exercise_object = Exercise.find_exercise(exercise)
            users_workout_plans = ExercisePlan.where(user_id: users_id)
            users_workout = users_workout_plans.where(exercise_id: exercise_object.id)
            users_workout_id = users_workout.first.id
            system "clear"
            puts "#{exercise} has been removed from your list"
            ExercisePlan.destroy(users_workout_id)
            sleep(3,)
            system "clear"
        when "military-press"
            users_id = current_user.id
            exercise = "military-press"
            exercise_object = Exercise.find_exercise(exercise)
            users_workout_plans = ExercisePlan.where(user_id: users_id)
            users_workout = users_workout_plans.where(exercise_id: exercise_object.id)
            users_workout_id = users_workout.first.id
            system "clear"
            puts "#{exercise} has been removed from your list"
            ExercisePlan.destroy(users_workout_id)
            sleep(3,)
            system "clear"
        when "vma-hit"
            users_id = current_user.id
            exercise = "vma-hit"
            exercise_object = Exercise.find_exercise(exercise)
            users_workout_plans = ExercisePlan.where(user_id: users_id)
            users_workout = users_workout_plans.where(exercise_id: exercise_object.id)
            users_workout_id = users_workout.first.id
            system "clear"
            puts "#{exercise} has been removed from your list"
            ExercisePlan.destroy(users_workout_id)
            sleep(3,)
            system "clear"
        when "bicep-twentys"
            users_id = current_user.id
            exercise = "bicep-twentys"
            exercise_object = Exercise.find_exercise(exercise)
            users_workout_plans = ExercisePlan.where(user_id: users_id)
            users_workout = users_workout_plans.where(exercise_id: exercise_object.id)
            users_workout_id = users_workout.first.id
            system "clear"
            puts "#{exercise} has been removed from your list"
            ExercisePlan.destroy(users_workout_id)
            sleep(3,)
            system "clear"
        end
    end
end