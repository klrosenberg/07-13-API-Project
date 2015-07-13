require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class GithubLink
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :assignment_id, :student_id

  # Instantaites a new instance of the BeerType Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the BeerType Class.
  def initialize(options = {})
    @id = options['id']
    @assignment_id = options['assignment_id']
    @student_id = options['student_id']
  end
end