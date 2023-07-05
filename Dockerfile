# Use swaggerapi/swagger-ui as the base image
FROM swaggerapi/swagger-ui:latest

# Set an environment variable
ENV NGINX_ENVSUBST_FILTER="^TO_FILTER.*"
