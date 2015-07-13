# Create database for this program.
DATABASE = SQLite3::Database.new("assignments.db")

# Make the tables
DATABASE.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, name TEXT UNIQUE, description TEXT, github_link_id INTEGER, blog_link_id INTEGER, student_id INTEGER);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS github_links (id INTEGER PRIMARY KEY, link TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS blog_links (id INTEGER PRIMARY KEY, link TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS students_assignments (id INTEGER PRIMARY KEY, assignment_id INTEGER, student_id INTEGER);")


# Return results as an Array of Hashes.
DATABASE.results_as_hash = true