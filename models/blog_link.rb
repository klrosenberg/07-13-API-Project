require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class BlogLink
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :link

  # Instantaites a new instance of the BlogLink Class.
  # 
  # options = {}- optional argument Hash
  # 
  # Returns new object of the BlogLink Class.
  def initialize(options = {})
    @id = options['id']
    @link = options['link']
  end
end