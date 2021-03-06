require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Student
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :name

  # Instantaites a new instance of the Student Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the Student Class.
  def initialize(options = {})
    @id = options['id']
    @name = options['name']
  end
  
  def self.chart
    DATABASE.execute("SELECT students.name FROM students;")
  end
  
  def hash_object
      hash = {"id" => self.id, "name" => self.name}
      return hash
    end
end