# -----------------------------------------------------------------------------
# API of all assignments.
# -----------------------------------------------------------------------------
get "/api/assignments" do
  @assignments = Assignment.hash
  json @assignments
end

# -----------------------------------------------------------------------------
# API of all assignments by id.
# -----------------------------------------------------------------------------
get "/api/assignments/:id" do
  @assignment = Assignment.find(params["id"])
  @assignment_hash = @assignment.hash_object
  json @assignment_hash
end

# -----------------------------------------------------------------------------
# API selection of specific column (e.g. github or blog links).
# -----------------------------------------------------------------------------
get "/api/links/:column" do
  @links = Assignment.select(params["column"])
  json @links
end

# -----------------------------------------------------------------------------
# API of all students worked with.
# -----------------------------------------------------------------------------
get "/api/students" do
  @students = Student.all
  @students_hash = []
  
  students.each do |student|
    @students_hash << @student.hash_object
  end
  json @students_hash
end

# -----------------------------------------------------------------------------
# API of all assignments worked on with a given student.
# -----------------------------------------------------------------------------
get "/api/assignments/student/:id" do
end

# -----------------------------------------------------------------------------
# Add a student to the API.
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Add a blog link to an existing assignment.
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Add a student assignment collaboration.
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Remove a student assignment collaboration.
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Remove a link from an assignment.
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Remove an assignment. TODO check!
# -----------------------------------------------------------------------------
get "/api/delete_assignment/:id" do
  @assignment = Assignment.find(params["id"])
  @assignment.delete
end
