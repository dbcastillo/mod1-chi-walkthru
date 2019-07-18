require_relative 'config/environment'

def welcome
    system "clear"
    puts "WELCOME TO WORKOUT WORLD!"
    sleep(3,)
end


def main_menu(current_user)
    prompt = TTY::Prompt.new
    user_input = prompt.select("Choose your action",
    %w(See_Your_Exercises See_All_Stats Add_Exercise Delete_Exercise Start_Over))
    
    case user_input 
    when "See_Your_Exercises"
        Exercise.see_exercises(current_user)
        main_menu(current_user)
    when "See_All_Stats"
        ExercisePlan.see_all_stats
        main_menu(current_user)
    when "Add_Exercise"
        Exercise.add_exercise(current_user)
        main_menu(current_user)
    when "Delete_Exercise"
        Exercise.delete_exercise(current_user)
        main_menu(current_user)
    when "Start_Over"
        current_user = User.setup_user
        main_menu(current_user)
    end
end

welcome

current_user = User.setup_user

main_menu(current_user)