# -----------------------------------------------------------------------------
# Add student to table
# -----------------------------------------------------------------------------
get "/save_student" do
    Student.add({"name" => params['name']})
    erb :"students/added_student"
end

# -----------------------------------------------------------------------------
# Students listed in a table.
# -----------------------------------------------------------------------------
get "/students/list_students" do
  @students = Student.chart
  erb :"/students/list_students"
end

# -----------------------------------------------------------------------------
# List students to possibly be updated.
# -----------------------------------------------------------------------------
get "/students/update_student" do
  @student = Student.chart
  erb :"/students/update_student"
end

# -----------------------------------------------------------------------------
# Update assignment by id.
# -----------------------------------------------------------------------------
get "/students/change_student" do
  @student = Student.find(params["id"].to_i)
  erb :"/students/change_student"
end

# -----------------------------------------------------------------------------
# Student name updated.
# -----------------------------------------------------------------------------
get "/update_student/save" do
  @student = Student.find(params['id'])
  @student.name = params["name"]
  @student.save
  erb :"students/student_updated"
end

# -----------------------------------------------------------------------------
# Student deleted.
# -----------------------------------------------------------------------------
get "/student_deleted" do
  @student = Student.find(params['id'])
  @student.delete
  erb :"/students/student_deleted"
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/students/:something" do
  erb :"/students/#{params["something"]}"
end