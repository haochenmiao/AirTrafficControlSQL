# Flight Database on Azure
## Introduction
Welcome to the Flight Database repository. This repository contains a series of SQL files designed to interact with a flight database hosted on Azure. These files cover various operations, including data integrity checks, querying flight durations, and more.
## Getting Started
### Prerequisites
* An Azure account with access to the Flight Database.
* SQL Server Management Studio (SSMS) or a similar SQL database management tool.

### Setting Up
1. `Clone the Repository:` Clone this repository to your local machine using Git.

```
  git clone [repository-url]

```
2. `Connect to the Azure Database:` Use your database management tool to connect to the Azure-hosted flight database. You'll need the following credentials:
    * Server Name
    * Database Name
    * User
    * Password

## Using the SQL Files
This repository contains the following SQL files:
1. `start.sql` - Queries that creates data scource from flight website
2. `second.sql` - Queries that creates necessary tables like 'Carriers', 'Months', 'Weekdays', and 'Flights'
3. `third.sql` - Queries that perform bulk data imports from CSV files into database tables named 'Carriers', 'Months', 'Weekdays', and 'Flights', and then creating indexes on the 'Flights' table to improve query performance.
4. `last.sql` - Queries that check counts from each table
5. `1.5hr_below_perc.sql` - Queries to find flights with durations below 1.5 hours.
6. `4hr_below_flight.sql` - Queries related to flights under 4 hours.
7. `data_integrity_check.sql` - Scripts to ensure data integrity within the database.
8. `max_flight.sql` - Queries to find the flight with the maximum duration.
9. `one_stop.sql` - Queries for flights with one stop.
10. `seattle_nyc_non_subquery.sql` - Queries for flights from Seattle to NYC without using subqueries.
11. `seattle_to_NYC.sql` - Queries for flights from Seattle to NYC.
12. `two_or_more_stops.sql` - Queries for flights with two or more stops.

To run these scripts:

Open the desired SQL file in your SQL database management tool.
Ensure you are connected to the Azure-hosted flight database.
Execute the script.

## Contributing
We welcome contributions to this repository. If you have a suggestion for an improvement or a new feature, please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature/YourFeature).
Make your changes.
Commit your changes (git commit -am 'Add some feature').
Push to the branch (git push origin feature/YourFeature).
Open a pull request.