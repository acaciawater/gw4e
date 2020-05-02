GW4E for Docker
===============
This Docker setup contains: GW4E code, postgres and redis (for cache and thumbnails)
The postgres database will be stored in ./pgdata

#### Create ./django.env file with django settings:

```
DEBUG=<True|False>  
ALLOWED_HOSTS=<allowed hosts>
DB_HOST=db  
DB_NAME=<database>
DB_USER=<username>
DB_PASSWORD=<password>
REDIS_HOST=redis  
REDIS_PORT=6379  
SECRET_KEY=<secret key>
GOOGLE_MAPS_API_KEY=<api key>
```
#### Create ./pg.env file with postgres settings:

```
POSTGRES_DB=<database>
POSTGRES_USER=<username>
POSTGRES_PASSWORD=<password>
```
#### Import existing data (optional):

1. dump your existing database using pg_dump and put the sql file in the ./intdb.d directory
2. make symbolic link ./media to existing media folder with maps and documents
