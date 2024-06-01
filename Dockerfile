# Use the official MongoDB image from the Docker Hub
FROM mongo:5.0

# Set environment variables for MongoDB
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password
ENV MONGO_INITDB_DATABASE=mydatabase

# Copy initialization scripts if any (optional)
# COPY ./init-scripts /docker-entrypoint-initdb.d/

# Expose the default MongoDB port
EXPOSE 27017

# Default command to run MongoDB
CMD ["mongod"]
