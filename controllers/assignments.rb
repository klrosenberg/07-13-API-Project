# -----------------------------------------------------------------------------
# Add assignment to table
# -----------------------------------------------------------------------------
get "/save_assignment" do
  Assignment.add({"date" => params['date'], "name" => params['name'], "description" => params['description'], "github" => params['github'].to_i, "blog" => params['blog'].to_i})
  erb :"/assignments/added_assignment"
end

# -----------------------------------------------------------------------------
# List assignments in a table.
# -----------------------------------------------------------------------------
get "/assignments/list_assignments" do
  @assignments = Assignment.chart
  erb :"/assignments/list_assignments"
end

# -----------------------------------------------------------------------------
# Update assignment by id.
# -----------------------------------------------------------------------------
get "/assignments/update_assignment" do
  @assignment = Assignment.find(params["id"].to_i)
  erb :"/assignments/update_assignment"
end

# -----------------------------------------------------------------------------
# Assignment name updated.
# -----------------------------------------------------------------------------
get "/update_assignment/save" do
  @assignment = Assignment.find(params['id'].to_i)
  @assignment.date = params["date"]
  @assignment.name = params["name"]
  @assignment.github = params["github"]
  @assignment.blog = params["blog"]
  if @assignment.save
    erb :"/assignments/assignment_updated"
  else
    @error = true
    erb :"/assignments/update_assignment"
  end
end

# -----------------------------------------------------------------------------
# Assignment deleted.
# -----------------------------------------------------------------------------
get "/assignment_deleted" do
  @assignment = Assignment.find(params['id'].to_i)
  erb :"/assignments/assignment_deleted"
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/assignments/:something" do
  erb :"/assignments/#{params["something"]}"
end
