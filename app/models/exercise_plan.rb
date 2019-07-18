class ExercisePlan < ActiveRecord::Base
    belongs_to :user
    belongs_to :exercise

    def self.most_popular_exercise
        # SEE OCCURENCES OF EACH EXERCISE BY ID
        exercise_occurences = ExercisePlan.all.group(:exercise_id).count
        # SEE MOST FREQUENT ID
        most_frequent_id = exercise_occurences.sort_by {|k,v| v}.last[0]
        # FIND MOST EXERCISE BY ID
        most_popular = Exercise.find(most_frequent_id).name
        
        # popular_exercise_plan = self.all.max_by { |exercise| Exercise.count(exercise.exercise_id) }
        # popular_exercise_plan.exercise.name
    end

    def self.exercise_users(exercise_name)
        # GRAB THE ID FROM THE EXERCISE NAME
        exercise_object_id = Exercise.select {|workout| workout.name == exercise_name}.first.id

        # FIND THE EXERCISE PLANS THAT HAVE EXERCISES WITH THIS ID 
        exercise_plans = ExercisePlan.where("exercise_id == #{exercise_object_id}")

        # EXTRACT THE USER IDs FROM THIS LIST
        plan_ids = exercise_plans.map {|plan| plan.user_id}

        # ITERATE OVER THE USER IDs AND SHOW THE NAME OF THE USER
        plan_ids.map {|num| User.find(num)}.map(&:name).each {|name| puts name}

    end

    def self.users_on_largest_team
        # ITERATE OVER USERS AND GROUP BY TEAM
        grouped_teams = User.all.group_by{|user| user.team}
        # grouped_teams = User.group(:team).count

        # SORT BY THE TEAM'S SIZE
        sorted_teams = grouped_teams.sort_by {|team_name, user_list| user_list.size}

        # FIND THE LAST (LARGEST) TEAM
        largest_team = sorted_teams.last

        # EXTRACT USERS FROM LARGEST TEAM
        users = largest_team[1].map {|user| user.name}

        # PRINT NAME OF USERS
        users.each {|name| puts name}
    end

    def self.see_all_stats
        prompt = TTY::Prompt.new
        users_input = prompt.select("Choose One",
        %w(Most_Popular_Exercise See_All_Users_For_Given_Exercise Show_Users_On_Largest_Team))
        case users_input 
        when "Most_Popular_Exercise"
            popular = ExercisePlan.most_popular_exercise
            system "clear"
            puts popular
            sleep(3,)
            system "clear"
        when "See_All_Users_For_Given_Exercise"
            puts "Please enter exercise:"
            exercise = gets.chomp
            exercisers = ExercisePlan.exercise_users(exercise)
            system "clear"
            puts exercisers
            sleep(3,)
            system "clear"
        when "Show_Users_On_Largest_Team"
            users = ExercisePlan.users_on_largest_team
            system "clear"
            puts users 
            sleep(3,)
            system "clear"
        end
    end
end