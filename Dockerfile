# Step 1: Use official Tomcat as base image
FROM tomcat:9.0-jdk17-openjdk

# Step 2: Remove default apps (optional but clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy WAR file built by Maven
COPY target/*.war /usr/local/tomcat/webapps/

# Step 4: Expose port 8080
EXPOSE 8080

# Step 5: Start Tomcat
CMD ["catalina.sh", "run"]
