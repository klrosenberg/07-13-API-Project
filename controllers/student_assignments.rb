# -----------------------------------------------------------------------------
# Add student assignment to table
# -----------------------------------------------------------------------------
get "/save_student_assignment" do
  StudentAssignmenet.add({"assignment_id" => params['assignment_id'].to_i, "student_id" => params['student_id'].to_i})
  erb :"/assignments/added_student_assignment"
end