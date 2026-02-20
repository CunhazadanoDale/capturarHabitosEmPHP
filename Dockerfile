FROM php:8.3-fpm-alpine

# Instalar extensões necessárias
RUN apk add --no-cache \
    postgresql-dev \
    curl \
    git \
    unzip \
    libpq

# Instalar extensões PHP
RUN docker-php-ext-install pdo_pgsql

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copiar arquivos do projeto
COPY . .

# Instalar dependências PHP
RUN composer install --no-interaction --no-dev --optimize-autoloader

# Permissões
RUN chown -R www-data:www-data . && chmod -R 755 storage bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
