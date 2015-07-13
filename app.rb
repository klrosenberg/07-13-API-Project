require "pry"
require "sinatra"
require "sinatra/reloader"
require "sinatra/json"

set :bind, '192.168.1.47'

# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/assignment.rb"
require_relative "models/student.rb"
require_relative "models/student_assignment.rb"


# Controllers
require_relative "controllers/assignments.rb"
require_relative "controllers/students.rb"
require_relative "controllers/student_assignments.rb"
require_relative "controllers/main.rb"
require_relative "controllers/api_controller.rb"
