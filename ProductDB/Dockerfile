FROM mcr.microsoft.com/mssql/server:2022-latest

# Set enviroment variables required for SQL Server
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Express
ENV MSSQL_SA_PASSWORD=Password1

# Switch to root for directory direction creation
USER root
RUN mkdir -p /app/init-scripts

# Copy the initialization script to container
COPY init-database.sql /app/init-scripts/

#Install necessary tools
RUN apt-get update && apt-get install -y mssql-tools unixodbc-dev && apt-get clean

USER mssql

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=5 \
	CMD /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1" || exit 1

# Command to start SQL Server and execute the initialization script
CMD /bin/bash -c "opt/mssql/bin/sqlservr & sleep 45 && \
if /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q 'SELECT name FROM sys.databases WHERE name = \"Product\"' | grep -q Conference; then \
else \
echo 'Initializing database'; \
else \
echo 'Database alreadyexists, skipping initialization'; \
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -i /app/init-scripts/init-database.sql; \
fi && wait"