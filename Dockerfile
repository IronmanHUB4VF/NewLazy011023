# FROM python:3.8-slim-buster

# RUN apt update && apt upgrade -y
# RUN apt install git -y
# COPY requirements.txt /requirements.txt

# RUN cd /
# RUN pip3 install -U pip && pip3 install -U -r requirements.txt
# RUN mkdir /LazyPrincess
# WORKDIR /LazyPrincess
# COPY start.sh /start.sh
# CMD ["/bin/bash", "/start.sh"] 

# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN mkdir /LazyPrincess
# Set the working directory in the container
WORKDIR /LazyPrincess

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY start.sh /start.sh

# Define the command to start your bot
CMD ["bash", "start.sh"] 
