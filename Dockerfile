# Use the official PHP 8.3 FPM image
FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Generate application key
RUN php artisan key:generate

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set appropriate file permissions
RUN chmod -R 775 storage && \
    chown -R www-data:www-data storage && \
    touch storage/logs/laravel.log && \
    chmod 664 storage/logs/laravel.log && \
    chown www-data:www-data storage/logs/laravel.log

# Start PHP-FPM
CMD ["php-fpm"]

