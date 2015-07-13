# -----------------------------------------------------------------------------
# Add assignment to table
# -----------------------------------------------------------------------------
get "/save_assignment" do
  if Assignment.include(params['name']) 
    @error1 = true
    erb :"/assignments/add_assignment" 
  elsif Assignment.empty(params['name'])
    @error2 = true
    erb :"/assignments/add_assignment"
  else
    Assignment.add({"date" => params['date'], "name" => params['name'], "description" => params['description'], "github_link_id" => params['github_link_id'].to_i, "blog_id" => params['blog_id'].to_i})
    erb :"/assignments/added_assignment"
  end
end

# -----------------------------------------------------------------------------
# List assignments in a table.
# -----------------------------------------------------------------------------
get "/assignments/list_assignments" do
  @assignments = Assignment.chart
  erb :"/assgnmentss/list_assignments"
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
  @assignment.github_link_id = params["github_link_id"]
  @assignment.blog_link_id = params["blog_link_id"]
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
  if StudentAssignments.where("assignment_id", params['id']).length > 0
    @error = true
    erb :"/assignments/delete_assignment"
  else @assignment.delete
    erb :"/assignments/assignment_deleted"
  end
end

# -----------------------------------------------------------------------------
# Returns erb associated with.
# -----------------------------------------------------------------------------
get "/assignments/:something" do
  erb :"/assignments/#{params["something"]}"
end
