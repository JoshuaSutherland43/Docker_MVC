# 🐳 ASP.NET MVC Application with Dockerized SQL Server Database

This project is a containerized **ASP.NET MVC C# web application** that utilizes **Entity Framework Core migrations** and connects to a **Dockerized SQL Server** database using Docker Compose. It's designed for easy setup and consistent development environments.

---

## 📋 Report

### 👥 Roles

#### 🎯 Masixole Ncoko  
> MVC application and Docker image creation

#### 🐳 Joshua Sutherland  
> Docker Compose and Dockerfile creation, database connection/creation, migrations and `DbContext` handling, and initialization of the database.

#### 🧪 Samkelo Maswana  
> Planning and execution of testing

---

## 🛠 MVC Overview (Masixole)

- Reused a previously built Docker image and created a new container on a different port.
- Created a simple database in SSMS called **Product**, and connected it to the container.
- Developed an ASP.NET Core Web App named `WebsiteDocker`.
- Added a connection string, created a `Product` model, and set up `DbContext`.
- Updated `Program.cs` to handle database context.
- Used Visual Studio to auto-generate the `ProductsController`.
- Migrations were added by another contributor.

---

## 🔧 Docker, Database, and MVC Optimization (Joshua)

After Masi's initial setup, the following improvements were made:

### Key Issues Resolved:
1. **Connection String** problems
2. Missing **Migrations**
3. **Outdated Docker files**
4. Incorrect **Model properties**
5. Incorrect **Docker file/compose location**

### Actions Taken:

- SQL Server container was reconfigured to expose port `1433` and used `localhost`.
- Database named `Product` was created inside the container.
- Connection string environment variable added to `Program.cs`:

```csharp
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
```

- Migrations were added and applied.
- Dockerfiles were updated and corrected.
- Docker Compose was moved to the correct location.
- Application successfully connected to the database and displayed data on the `Products` page.

---

## ❗ Challenges Faced

### 🙍‍♂️ Masixole (MVC)

- Difficulty in reusing previous Docker images with different command sets.
- Misconfigured port `5000` from the beginning, leading to later issues.
- Persistent SQL Server connection errors.
- Extensive trial and error on connection strings and firewall settings.
- Failed attempts at Dockerfile and Compose file creation.
- Overall found the entire MVC configuration to be a major challenge.

---

### 🧑‍💻 Joshua (Docker, SQL, Migrations)

- Rebuilding and testing Docker image for SQL Server.
- Handling connection string via environment variables.
- Resolving EF Core migration issues due to model errors and NuGet versions.
- Moving Docker Compose to the correct path and validating it builds correctly.

---

## 🚀 How to Download and Run the Application

### 🧰 Prerequisites

Ensure the following are installed:

- [.NET SDK 6.0 or later](https://dotnet.microsoft.com/download)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Git](https://git-scm.com/)

---

### 🐳 Docker Containers Used

- `mvc_app`: ASP.NET MVC application container
- `sql_db`: SQL Server container

---

### 📦 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-mvc-docker-app.git
cd your-mvc-docker-app
```

---

### ⚙️ 2. Configure `appsettings.json`

Ensure it contains the correct connection string:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=sql_db;Database=YourDbName;User=sa;Password=YourStrongPassword123;"
}
```

> `sql_db` matches the container name in `docker-compose.yml`.

---

### 🛠️ 3. Build and Run the Application

```bash
docker-compose up --build
```

This will:
- Build the ASP.NET MVC Docker image
- Pull/start the SQL Server container
- Run both containers in a connected network

---

### 🧬 4. Apply EF Core Migrations

After the containers are running:

```bash
docker exec -it mvc_app dotnet ef database update
```

If no migrations exist:

```bash
docker exec -it mvc_app dotnet ef migrations add InitialCreate
docker exec -it mvc_app dotnet ef database update
```

---

### 🌐 5. Access the Web App

Open your browser and visit:

```
http://localhost:5000
```

---

## ✅ Final Remarks

With the database connected, migrations applied, and Docker services running smoothly, the application should now display data from the `Products` table.

Feel free to test by adding new entries to the `Products` table via SQL Server Management Studio or using the web interface.

---

## 🧠 Authors

- **Masixole Ncoko** – MVC Implementation  
- **Joshua Sutherland** – Docker, SQL Server, Migrations  
- **Samkelo Maswana** – Testing Support

---
