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
  
  # Join github links, blog links and students tables to assignments table.
  #
  # Returns an Array of Hashes.
  def self.chart
    DATABASE.execute("SELECT assignments.date, assignments.name AS assignment, assignments.description, assignments.github, assignments.blog FROM assignments;")
  end
  
  def save
    return true if DATABASE.execute("UPDATE assignments SET date = '#{@date}', name = '#{@name}', description = '#{@description}', github = '#{@github}', blog = '#{@blog}' WHERE id = #{@id};") 
  end
  
  def hash_object
      hash = {"id" => self.id, "date" => self.date, "name" => self.name, "description" => self.description, "github" => self.github, "blog" => self.blog}
      return hash
    end
end