# PDF Generator
   
### Database configuration
    import the database file (edit_me.sql)
### Commandes:
+ composer install
+ cp .env.example .env
+ `Configure the .env file by: entering the database information, and setting the APP_URL to http://localhost:8000`
+ php artisan passport:install
+ php artisan key:generate
+ php artisan storage:link
+ php artisan cache:clear
+ php artisan serve
