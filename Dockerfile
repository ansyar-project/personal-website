# Use the official NGINX base image
FROM nginx:latest

# Copy your custom NGINX configuration (if needed)
# Uncomment and replace 'nginx.conf' with your custom configuration file
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy your website files to the default NGINX web directory
# Replace 'your-website-content' with your directory containing the files
COPY . /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]