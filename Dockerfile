# Use official PHP image with Apache
FROM php:8.1-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql zip

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy all files to container
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
RUN chmod -R 755 /var/www/html
RUN echo "DirectoryIndex index.php" >> /etc/apache2/conf-enabled/docker-php.conf
