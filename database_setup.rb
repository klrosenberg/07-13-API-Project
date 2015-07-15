# Create database for this program.
DATABASE = SQLite3::Database.new("assignments.db")

# Make the tables
DATABASE.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, date TEXT, name TEXT UNIQUE, description TEXT, github TEXT, blog TEXT DEFAULT none);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS student_assignments (id INTEGER PRIMARY KEY, assignment_id INTEGER, student_id INTEGER);")


# Return results as an Array of Hashes.
DATABASE.results_as_hash = true