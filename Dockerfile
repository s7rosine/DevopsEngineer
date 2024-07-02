# Use the correct syntax for the base image
FROM ubuntu:20.04

# Update package lists and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    unzip

# Clone the repository, unzip it, and clean up the zip file
RUN git clone https://group5-braincells.s3.amazonaws.com/python-web-app.zip && \
    unzip python-web-app.zip && \
    rm python-web-app.zip && \
    mv python-web-app/* /app/

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install the required Python packages
RUN pip3 install -r requirements.txt

# Expose the port your application will run on
EXPOSE 8000

# Define the command to run your application
ENTRYPOINT ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

