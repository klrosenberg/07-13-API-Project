# -----------------------------------------------------------------------------
# List assignments in a table.
# -----------------------------------------------------------------------------
get "/assignments/list_assignments" do
  @assignments = Assignment.chart
  erb :"/assgnmentss/list_assignments"
end