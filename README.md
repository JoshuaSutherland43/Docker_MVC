# Docker_MVC
#
## Report
#
### Roles:
#### Masixole Ncoko: 
-> MCV Application and Docker image creation.
#
#### Joshua Sutherland: 
-> Docker Compose and Docker File creation, database connection/creation, Migrations and DB Context handling, and finally the init_database file.
# 
#### Samkelo Maswana: 
-> Helped with planning and execution of testing.

#
### MVC:
Firstly, for the first part I used the same image we created from the previous activity in class and created a new container instead to a different port and name. Secondly, I created a very simple database in SSMS called Product and connected it to the container.  

For the second part I created a ASP.NET Core web app called WebsiteDocker, added my connection string, created a product model to match the database, created a DbContext class, made the necessary changes in the main program.cs file and finally created the ProductsController (note: I did not code this part myself but had visual studio autogenerate it itself). Migrations where also added later but this was not done by me. 

For the third part I attempted to create a docker-compose.yml file based on the previous exercise we did as well as a dockerfile however these ended up having issues.

#
### Docker, Database and MVC Connection/Optimization:
I began developing the code after Masi attempted the beginning stages. I discovered the following areas needing focus:
1. Connection string regarding issues.
2. Migrations being non-existant.
3. Outdated Docker Files.
4. Error in model variables for Product.
5. Issue with location of Docker Compose and Files.

I discovered that the port 5000 was not establishing with the Sequel Server Management Studio, thus we remade the docker image for the database.
We named the port as localhost, 1433. Utilizing this new port, I created a database and named it Product. 

I then went and corrected the connection strings and modified the program.cs in the application to create the sql string in the Environment.
            C# Code: 
            
            var connectionString = Environment.GetEnvironmentVariable("SQL_CONNECTION_STRING") ??
                       builder.Configuration.GetConnectionString("DefaultConnection");

            if (string.IsNullOrWhiteSpace(connectionString))
            {
                throw new InvalidOperationException("SQL connection string not found.");
            }

            builder.Services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(connectionString, sqlOptions =>
                {
                    sqlOptions.EnableRetryOnFailure();
                }));

After correcting the connection string I added in migrations to the application and made changes to the variables in the model Product. I then went and created the table Products in the database successfully.

When migrations was finished, I turned my attention to the docker files. Ensuring that the information is updated and correct. I added modifications to the local host number and implemented lines found in our previous docker activity needed to ensure the environment is successfully established.

I was then encountering an issue with building/updating the docker compose. I then located the file in the application folder. I moved the file to the correct location and decided to build the compose file again and it was a success!

Lastly, I inserted some products into the Products table to check if the MVC was working and hazaa! It indeed was.
#
### Difficulties:
#### Masixole (MVC):
- My first challenge was making use of the same image we created in the previous exercise instead of creating a new one for this task, since this demanded different commands then the ones we were taught. 

- Another challenge was one that affected my project right up until submission/presentation and that was mapping the host port to 5000 right from the beginning which may have caused unnecessary issues later. 

- Majority of my issues came from the MVC application as whenever I tried to navigate to the Products page after running the web app it always failed to connect the sql server. I tried so many fixes like altering the connection string, changing my firewall settings in windows defender and even creating a console app called WebsiteDockerTest just for testing the connection string but to no avail.  

- Finally failing to correctly create the docker file and docker-compose file. 
  
- In the simplest terms I basically found everything to be challenging. 

#
#### Joshua (Docker Files/Compose, SQL, Migrations):
My challenges mostly derrived from the following:

- Recreating the docker image for the database.
- Adjusting the connection string to work with environment.
- Ensuring migrations were working as there were errors with variables and nuget versions.
- Locating and relocation of the Docker Compose file.
  
#
## How to download the application:


