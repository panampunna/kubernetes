
FROM nginx:latest

# Copy the HTML file to the Nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Add a script to start Nginx, wait for a while, and then stop
COPY start-nginx.sh /usr/local/bin/start-nginx.sh
RUN chmod +x /usr/local/bin/start-nginx.sh

# Expose port 81
EXPOSE 81

# Use the script as the command
CMD ["sh", "/usr/local/bin/start-nginx.sh"]

