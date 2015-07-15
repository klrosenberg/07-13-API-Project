require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Assignment
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id 
  attr_accessor :date, :name, :description, :github, :blog

  # Instantaites a new instance of the Assignment Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the Assignment Class.
  def initialize(options = {})
    @id = options['id']
    @date = options['date']
    @name = options['name']
    @description = options['description']
    @github = options['github']
    @blog = options['blog']
  end
  
  # Chart assignments table.
  #
  # Returns an Array of Hashes.
  def self.chart
    DATABASE.execute("SELECT assignments.date, assignments.name AS assignment, assignments.description, assignments.github, assignments.blog FROM assignments;")
  end
  
  # Update an assignment.
  #
  # Return an updated Hash. (? TODO)
  def save
    return true if DATABASE.execute("UPDATE assignments SET date = '#{@date}', name = '#{@name}', description = '#{@description}', github = '#{@github}', blog = '#{@blog}' WHERE id = #{@id};")
  end
  
  # Create hash of all instances.
  #
  # Returns Hash.
  def hash
    hash = {"id" => self.id, "date" => self.date, "name" => self.name, "description" => self.description, "github" => self.github, "blog" => self.blog}
    return hash
  end
  
  # Join sql tables. Can be used with find method to display by student id.
  #
  # Returns Hash of joined sql tables.
  def hash_object
    hash = DATABASE.execute("SELECT assignments.date, assignments.name AS assignments, assignments.description, assignments.github, assignments.blog, students.name FROM student_assignments JOIN assignments ON student_assignments.assignment_id = assignments.id JOIN students ON student_assignments.student_id = students.id;")
    return hash
  end 
end