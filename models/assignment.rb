require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Assignment
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id, 
  attr_accessor :date, :name, :description, :github_link_id, :blog_link_id, :student_id

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
    @github_link_id = options['github_link_id']
    @blog_link_id = options['blog_link_id']
    @student_id = options['student_id']
  end
  
  # Join github links, blog links and students tables to assignments table.
  #
  # Returns an Array of Hashes.
  def self.chart
    DATABASE.execute("SELECT assignments.date, assignments.name AS assignment, github_links.link AS github, blog_links.name AS Blog, students.name AS students FROM assignments JOIN github_links ON assignments.github_link_id = github_links.id JOIN blog_links ON assignments.blog_link_id = blog_link.id ORDER BY assignments.date(dateColumn) DESC Limit 1;")
  end

end