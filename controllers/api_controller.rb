get "/api/assignments" do
  @assignments = Assignment.hash
  json @assignments
end

get "/api/assignments/:id" do
  @assignment = []
  @assignment << Assignment.find(params["id"]).hash_object
  json @assignment
end
