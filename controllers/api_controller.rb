get "/api/assignments" do
  @assignments = Assignment.hash
  json @assignments
end

get "/api/assignments/:id" do
  json :foo => 'bar'
end