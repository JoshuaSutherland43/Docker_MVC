# Docker_MVC

--
## Report

--
### Roles:
#### Masixole Ncoko: 
-> MCV Application and Docker image creation.
#
#### Joshua Sutherland: 
-> Docker Compose and Docker File creation, database connection/creation, Migrations and DB Context handling, and finally the init_database file.
# 
#### Samkelo Maswana: 
-> Helped with planning and execution of testing.

-
### MVC:
Firstly, for the first part I used the same image we created from the previous activity in class and created a new container instead to a different port and name. Secondly, I created a very simple database in SSMS called Product and connected it to the container.  

For the second part I created a ASP.NET Core web app called WebsiteDocker, added my connection string, created a product model to match the database, created a DbContext class, made the necessary changes in the main program.cs file and finally created the ProductsController (note: I did not code this part myself but had visual studio autogenerate it itself). Migrations where also added later but this was not done by me. 

For the third part I attempted to create a docker-compose.yml file based on the previous exercise we did as well as a dockerfile however these ended up having issues.


### Docker, Database and MVC Connection/Optimization:


### Difficulties:
#### Masixole (MVC):
    1. My first challenge was making use of the same image we created in the previous exercise instead of creating a new one for this task, since this demanded different commands then the ones we were taught. 

    2. Another challenge was one that affected my project right up until submission/presentation and that was mapping the host port to 5000 right from the beginning which may have caused unnecessary issues later. 

    3. Majority of my issues came from the MVC application as whenever I tried to navigate to the Products page after running the web app it always failed to connect the sql server. 
    I tried so many fixes like altering the connection string, changing my firewall settings in windows defender and even creating a console app called WebsiteDockerTest just for testing the connection string but to no avail.  

    4. Finally failing to correctly create the docker file and docker-compose file. 
  
    5. In the simplest terms I basically found everything to be challenging. 

-
#### Joshua (Docker Files/Compose, SQL, Migrations):
