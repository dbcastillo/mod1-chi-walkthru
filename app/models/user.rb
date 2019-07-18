class User < ActiveRecord::Base
    has_many :exercise_plans
    has_many :exercises, through: :exercise_plans

    def self.setup_user
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select("Choose your user status",
            %w(New_User Current_User))

        if user_input == "New_User"
            self.create_new_user
        else
            self.find_existing_user
        end
    end
    
      def self.create_new_user
        puts "Please create username:"
        user_name = gets.chomp
        puts "Please create a team name:"
        team_name = gets.chomp
    
        current_user = User.create(name: user_name, team: team_name)
        system "clear"
        puts "New user created! Welcome, #{current_user.name}! You're on team #{current_user.team}"
        sleep(3,)
        system "clear"
        current_user
      end
    
      def self.find_existing_user
        puts "Please enter username:"
        user_name = gets.chomp
        current_user = User.where(name: user_name).first
        system "clear"
        if self.all.map { |user| user.name }.include?(user_name)
            system "clear"
            puts "Welcome back, #{current_user.name}!"
            sleep(3,)
            system "clear"
        else
          puts "Username not found"
          sleep(3,)
          system "clear"
          find_existing_user
        end
        current_user
      end
end