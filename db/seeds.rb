User.destroy_all
Exercise.destroy_all
ExercisePlan.destroy_all

adam = User.create(name: "Adam", team: "Beast")
derick = User.create(name: "Derick", team: "Beast")
bruce = User.create(name: "Bruce", team: "Titan")
jess = User.create(name: "Jess", team: "Beast")
duke = User.create(name: "Duke", team: "Titan")
raza = User.create(name: "Raza", team: "Titan")
noah = User.create(name: "Noah", team: "Titan")

run_the_rack = Exercise.create(name: "run-the-rack", exercise_type: "continous-failure")
military_press = Exercise.create(name: "military-press", exercise_type: "heavy-volume")
vma_hit = Exercise.create(name: "vma-hit", exercise_type: "explosive-superset")
bicep_twentys = Exercise.create(name: "bicep-twentys", exercise_type: "continuous-multi-angle")

one = ExercisePlan.create(user_id: adam.id, exercise_id: vma_hit.id)
two = ExercisePlan.create(user_id: derick.id, exercise_id: vma_hit.id)
three = ExercisePlan.create(user_id: jess.id, exercise_id: vma_hit.id)
four = ExercisePlan.create(user_id: bruce.id, exercise_id: run_the_rack.id)
five = ExercisePlan.create(user_id: duke.id, exercise_id: military_press.id)
six = ExercisePlan.create(user_id: raza.id, exercise_id: bicep_twentys.id)
seven = ExercisePlan.create(user_id: noah.id, exercise_id: bicep_twentys.id)

