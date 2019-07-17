require_relative 'config/environment'

def welcome
    system "clear"
    puts "WELCOME TO WORKOUT WORLD!"
    sleep(3,)
end

def main_menu(current_user)
    prompt = TTY::Prompt.new
    user_input = prompt.select("Choose your action",
    %w(See_Exercises See_Stats Add_Exercise Delete_Exercise Delete_User))

    case user_input 
    when "See_Exercises"
        if current_user.exercises.empty?
            puts "You have no exercises, please add an exercise"
            main_menu(current_user)
        else
            current_user.exercises.each do |exercise|
                puts exercise.name
            end
        end
    when "See_Stats"
    when "Add_Exercise"
    when "Delete_Exercise"
    when "Delete_User"
    end
end

welcome

current_user = User.setup_user
binding.pry
main_menu(current_user)