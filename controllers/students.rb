# -----------------------------------------------------------------------------
# Add student to table
# -----------------------------------------------------------------------------
get "/save_student" do
    Student.add({"name" => params['name']})
    erb :"students/added_student"
  end
end

get "/students/update_student" do
  @student = Student.find(params["id"])
  erb :"/students/update_student"
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
  @beer_type.delete
  erb :"/students/student_deleted"
  end
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/students/:something" do
  erb :"/students/#{params["something"]}"
end