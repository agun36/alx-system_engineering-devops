FROM debian:latest

# Update the package lists and install Apache
RUN apt-get update && apt-get install -y apache2

# Start Apache in the foreground when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
