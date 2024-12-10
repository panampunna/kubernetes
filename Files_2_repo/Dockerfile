# Use the image from AWS ECR as the base image (Need to load the nginx in AWS ECR before running this)
FROM 056621886287.dkr.ecr.ap-south-1.amazonaws.com/king-docker-image-ecr-repository:nginx

CMD ["echo", "#############################################################"]

RUN apt-get update && apt-get install -y apt-utils vim curl procps postgresql-client
RUN sleep 3
RUN pwd 

# Copy the required files from the build context to the container
COPY Files_2_repo/index.html /var/www/html/
COPY Files_2_repo/nginx.conf /etc/nginx/
COPY Files_2_repo/flowers.gif /var/www/html/
COPY Files_2_repo/lion-king-lion.gif /var/www/html/
COPY Files_2_repo/vjp.jpg /var/www/html/

# Run the chmod command to change permissions
RUN chmod 777 /var/www/html/*.gif
RUN chmod 777 /var/www/html/vjp.jpg
RUN chmod 777 /var/www/html/*.jpg

# List the directories and check their contents
RUN ls -lh /home
RUN ls -lh /etc/nginx/
RUN ls -lh /var/www/html/

# Set the working directory
WORKDIR /var/www/html

# Expose the appropriate port for Nginx
EXPOSE 80 

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

