# Purpose

To containerize in Docker a Symfony installation along with PHP-FPM, Nginx, Postgresql and PgAdmin4.
The Symfony container starts up already with the latest versions of Composer, Node and Symfony CLI installed.

# Installation

Copy the .env.dist and edit according to your needs:
```
cp .env.dist .env
```

Start your docker environment:
```
docker compose up --build -d
```

Install the latest Symfony version on your containerphp container:
```
docker exec -it my_symfony-php bash
```

Confirm if the environment has all the requirements needed to install Symfony:
```
symfony check:requirements
```

Install symfony:
```
composer create-project symfony/skeleton ./
```


## Installed Containers
- [php-fpm]
- [Postgresql 15]
- [Nginx] (http://localhost)
- [PgAdmin4] (http://localhost:5050)