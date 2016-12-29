# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts
"SELECT Projects.title, SUM(amount) FROM projects, pledges GROUP BY pledges.project_id, Projects.title HAVING Projects.id = pledges.project_id ORDER BY projects.title ASC;"
#tried : SELECT Projects.title, SUM(amount) FROM projects, pledges GROUP BY pledges.project_id, Projects.title HAVING Projects.id = pledges.project_id;
# SELECT project_id, SUM(amount) FROM pledges GROUP BY project_id;
#Figure out how to select all the titles from projects
#SELECT title FROM projects;
#Figure out how to list all the titles of the projects and 
#the corresponding pledge amount by project_id
#SELECT project_id, SUM(amount) FROM pledges GROUP BY project_id LEFT OUTER JOIN projects ON Pledges.project_id = Projects.title;
#figure out how to join the projects table with the corresponding pledges
#Tried : SELECT Projects.title, Pledges.amount FROM projects, pledges ORDER BY Pledges.project_id;"
#result was not a summation of the pledges per project, just a list of all the pledges and titles from the tables ordered by project_id
#figure out how to sum amounts and display titles in one query
#tried; "SELECT projects.title, SUM(amount) FROM projects, pledges GROUP BY Pledges.amount, Projects.title;"
#how to alphabetize titles: 
#" SELECT Projects.title FROM projects ORDER BY title;"
#how to get the sum amounts for each project id in pledges
#"SELECT SUM(amount) FROM pledges GROUP BY project_id;"

#how to combine both statements to be valid?
#tried: SELECT Projects.title, Pledges.amount FROM projects, pledges ORDER BY project_id;" #Select all the project_id and sum(amounts) of each project 
#tried: SELECT Projects.title, amount FROM projects, pledges;
#tried: SELECT Projects.title, SUM(amount) FROM projects, pledges GROUP BY pledges.project_id, Projects.title HAVING Projects.id = pledges.project_id;
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
"SELECT users.name,users.age,SUM(amount) FROM users, pledges ON pledges.user_id = users.id GROUP BY pledges.user_id ORDER BY name;"
#figure out how to select all the user names ages
#SELECT age FROM users;
#figure out how to select all the pledge amounts per user
#tried: SELECT users.age, users.id, pledges.user_id, pledges.amount FROM users, pledges;
#find the number of pledges per user id =1 , out of 20 users
#SELECT * FROM pledges WHERE user_id= 1;
#find the users id in users
#SELECT * FROM users WHERE user.id = 1;

end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT Projects.title, SUM(amount) - Projects.funding_goal FROM projects, pledges WHERE pledges.project_id = projects.id GROUP BY Projects.title HAVING projects.id = pledges.project_id ORDER BY SUM(amount) - Projects.funding_goal > -1 DESC LIMIT 2;"#select all titles
#SELECT Projects.title FROM projects;
#select sum amount of all pledges for each project
#find projects that have met their fundraising goals
#idea: use COUNT funding_goal - SUM(amount)
#use union? 

end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
"SELECT Users.name, SUM(amount) FROM pledges INNER JOIN users ON pledges.user_id = users.id GROUP BY users.name ORDER BY SUM(amount) ASC;"
#select users names and all their pledges individually
#SELECT users.name, pledges.amount FROM users, pledges WHERE users.id = pledges.user_id;

#select users names and their summed pledges
#SELECT Users.name, SUM(amount) FROM pledges INNER JOIN users ON pledges.user_id = users.id GROUP BY pledges.user_id;

	#order them by amount

end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT projects.category, pledges.amount FROM pledges LEFT JOIN projects ON pledges.project_id = projects.id WHERE projects.category = 'music';"
#select all categories
#SELECT category FROM projects;
#select pledges and categories
#select music category pledges
#SELECT projects.category, pledges.amount FROM projects, pledges WHERE category = "music";
#tried: SELECT projects.category, pledges.amount, pledges.project_id FROM projects, pledges WHERE pledges.project_id = 1 AND projects.id = 1 OR pledges.project_id = 6 AND projects.id = 6;"

end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
"SELECT projects.category, SUM(amount) FROM pledges LEFT JOIN projects ON pledges.project_id = projects.id GROUP BY projects.category HAVING projects.category = 'books';"
end
