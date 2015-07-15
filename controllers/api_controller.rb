# -----------------------------------------------------------------------------
# API of all assignments
# -----------------------------------------------------------------------------
get "/api/assignments" do
  @assignments = Assignment.hash
  json @assignments
end

get "/api/assignments/:id" do
  @assignment = []
  @assignment << Assignment.find(params["id"]).hash_object
  
  
  json @assignment
end

# -----------------------------------------------------------------------------
# API of all students worked with.
# -----------------------------------------------------------------------------
get "/api/students" do
  students = Student.all
  students_hash = []
  
  students.each do |student|
    students_hash << student.hash_object
  end
  json students_hash
end
