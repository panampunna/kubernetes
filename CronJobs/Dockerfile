# Use the official Nginx base image from Docker Hub
FROM nginx
RUN apt-get update && apt-get install -y apt-utils vim

# Set a working directory within the container (optional)
WORKDIR /var/www/html

# Copy your custom Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the entrypoint script
COPY start_stop_Nginx.sh /usr/local/bin/start_stop_Nginx.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start_stop_Nginx.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/start_stop_Nginx.sh"]

# Copy your static files and assets to the web server directory
COPY index.html /usr/share/nginx/html/
COPY flowers.gif /usr/share/nginx/html/
COPY lion-king-lion.gif /usr/share/nginx/html/
COPY vjp.jpg /usr/share/nginx/html/
COPY mountains-1.jpg /usr/share/nginx/html/

# Run the chmod command to change permissions
RUN chmod 644 /usr/share/nginx/html/*.gif
RUN chmod 644 /usr/share/nginx/html/vjp.jpg
RUN chmod 644 /usr/share/nginx/html/*.jpg

# Expose the appropriate ports for Nginx
EXPOSE 80

# Create the directory for the nginx.pid file with proper permissions
RUN mkdir -p /var/run/nginx && chown root:root /var/run/nginx

