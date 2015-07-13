require "pry"
require "sinatra"
require "sinatra/reloader"

# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/assignment.rb"
require_relative "models/blog_link.rb"
require_relative "models/github_link.rb"
require_relative "models/student.rb"
require_relative "models/student_assignment.rb"


# Controllers
require_relative "controllers/assignments.rb"
require_relative "controllers/blog_links.rb"
require_relative "controllers/github_links.rb"
require_relative "controllers/students.rb"
require_relative "controllers/student_assignments.rb"
require_relative "controllers/main.rb"
