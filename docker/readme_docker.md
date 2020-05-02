GW4E for Docker
===============
This Docker setup contains: GW4E code, postgres and redis (for cache and thumbnails)

### Define django secrets in django.env

> DEBUG=&lt;True|False&gt;  
ALLOWED_HOSTS=&lt;allowed hosts&gt;  
DB_HOST=db  
DB_NAME=&lt;database&gt;  
DB_USER=&lt;username&gt;  
DB_PASSWORD=&lt;password&gt;  
REDIS_HOST=redis  
REDIS_PORT=6379  
SECRET_KEY=&lt;secret key&gt;  
GOOGLE\_MAPS\_API_KEY=&lt;api key&gt;  

### Define postgres secrets in pg.env

> POSTGRES_DB=&lt;database&gt;  
POSTGRES_USER=&lt;username&gt;  
POSTGRES_PASSWORD=&lt;password&gt;  

### Import existing data

1. dump your existing database using pg_dump and put the sql file in the ./intdb.d directory
2. make symbolic link ./media to existing media folder with maps and documents
