# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Insert data into studio table
new_studio = Studio.new
new_studio ["name"] = "Warner Bros."
new_studio.save

#Insert data into actors table
new_actor = Actor.new
new_actor ["name"] = "Christian Bale"
new_actor.save
#Test insertion using rails runner data.rb command; validated by examinging development log

new_actor_2 = Actor.new
new_actor_2 ["name"] = "Michael Caine"
new_actor_2.save

new_actor_3 = Actor.new
new_actor_3 ["name"] = "Liam Neeson"
new_actor_3.save

new_actor_4 = Actor.new
new_actor_4 ["name"] = "Katie Holmes"
new_actor_4.save

new_actor_5 = Actor.new
new_actor_5 ["name"] = "Gary Oldman"
new_actor_5.save

new_actor_6 = Actor.new
new_actor_6 ["name"] = "Heath Ledger"
new_actor_6.save

new_actor_7 = Actor.new
new_actor_7 ["name"] = "Aaron Eckhart"
new_actor_7.save

new_actor_8 = Actor.new
new_actor_8 ["name"] = "Maggie Gyllenhaal"
new_actor_8.save

new_actor_9 = Actor.new
new_actor_9 ["name"] = "Tom Hardy"
new_actor_9.save

new_actor_10 = Actor.new
new_actor_10 ["name"] = "Joseph Gordon-Levitt"
new_actor_10.save

new_actor_11 = Actor.new
new_actor_11 ["name"] = "Anne Hathaway"
new_actor_11.save

#Insert data into movies table
wb = Studio.find_by({"name" => "Warner Bros."})

new_movie = Movie.new
new_movie ["title"] = "Batman Begins"
new_movie ["year_released"] = "2005"
new_movie ["rated"] = "PG-13"
new_movie ["studio_id"] = wb ["id"]
new_movie.save

new_movie_2 = Movie.new
new_movie_2 ["title"] = "The Dark Knight"
new_movie_2 ["year_released"] = "2008"
new_movie_2 ["rated"] = "PG-13"
new_movie_2 ["studio_id"] = wb ["id"]
new_movie_2.save

new_movie_3 = Movie.new
new_movie_3 ["title"] = "The Dark Knight Rises"
new_movie_3 ["year_released"] = "2012"
new_movie_3 ["rated"] = "PG-13"
new_movie_3 ["studio_id"] = wb ["id"]
new_movie_3.save

#Insert data for roles table
bb = Movie.find_by({"title" => "Batman Begins"})
tdk = Movie.find_by ({"title" => "The Dark Knight"})
tdkr = Movie.find_by ({"title" => "The Dark Knight Rises"})

cb = Actor.find_by ({"name" => "Christian Bale"})
mc = Actor.find_by ({"name" => "Michael Caine"})
ln = Actor.find_by ({"name" => "Liam Neeson"})
kh = Actor.find_by ({"name" => "Katie Holmes"})
go = Actor.find_by ({"name" => "Gary Oldman"})
hl = Actor.find_by ({"name" => "Heath Ledger"})
ae = Actor.find_by ({"name" => "Aaron Eckhart"})
mg = Actor.find_by ({"name" => "Maggie Gyllenhaal"})
th = Actor.find_by ({"name" => "Tom Hardy"})
jg = Actor.find_by ({"name" => "Joseph Gordon-Levitt"})
ah = Actor.find_by ({"name" => "Anne Hathaway"})

new_role = Role.new
new_role ["movie_id"] = bb ["id"]
new_role ["actor_id"] = cb ["id"]
new_role ["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role ["movie_id"] = bb ["id"]
new_role ["actor_id"] = mc ["id"]
new_role ["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role ["movie_id"] = bb ["id"]
new_role ["actor_id"] = ln ["id"]
new_role ["character_name"] = "Ra's Al Ghul"
new_role.save

new_role = Role.new
new_role ["movie_id"] = bb ["id"]
new_role ["actor_id"] = kh ["id"]
new_role ["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role ["movie_id"] = bb ["id"]
new_role ["actor_id"] = go ["id"]
new_role ["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdk ["id"]
new_role ["actor_id"] = cb ["id"]
new_role ["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdk ["id"]
new_role ["actor_id"] = hl ["id"]
new_role ["character_name"] = "Joker"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdk ["id"]
new_role ["actor_id"] = ae ["id"]
new_role ["character_name"] = "Harvey Dent"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdk ["id"]
new_role ["actor_id"] = mc ["id"]
new_role ["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdk ["id"]
new_role ["actor_id"] = mg ["id"]
new_role ["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdkr ["id"]
new_role ["actor_id"] = cb ["id"]
new_role ["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdkr ["id"]
new_role ["actor_id"] = go ["id"]
new_role ["character_name"] = "Comissioner Gordon"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdkr ["id"]
new_role ["actor_id"] = th ["id"]
new_role ["character_name"] = "Bane"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdkr ["id"]
new_role ["actor_id"] = jg ["id"]
new_role ["character_name"] = "John Blake"
new_role.save

new_role = Role.new
new_role ["movie_id"] = tdkr ["id"]
new_role ["actor_id"] = ah ["id"]
new_role ["character_name"] = "Selina Kyle"
new_role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
