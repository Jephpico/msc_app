# # Use the official Python base image with the desired Python version
# FROM python:3.9.13

# # Set the working directory in the container
# WORKDIR /app

# # Copy the environment.yml file to the container
# COPY environment.yml .

# # Install conda and create a new environment using the environment.yml file
# RUN apt-get update && apt-get install -y curl && \
#     curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
#     bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
#     rm Miniconda3-latest-Linux-x86_64.sh && \
#     /opt/conda/bin/conda env create -f environment.yml

# # Activate the conda environment
# RUN echo "source activate obb" > ~/.bashrc
# ENV PATH /opt/conda/envs/obb/bin:$PATH

# # Copy the rest of your app files to the container
# COPY . .

# # Start the uvicorn server
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]


# Base image
FROM python:3.9

# Set the working directory
#WORKDIR /app

# Copy the requirements file
#COPY requirements.txt .

# Install build dependencies
 #RUN apt-get update && apt-get install -y build-essential

# # Install 'bt' package separately
 #RUN pip install --no-cache-dir bt

# Update pip
#RUN pip install --no-cache-dir --upgrade pip


# Install project dependencies
#RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files
#COPY . .

# Expose the port that FastAPI listens on (default is 8000)
#EXPOSE 8080

# Start the FastAPI application with uvicorn
##CMD ["python", "./main.py"]


WORKDIR /app
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 5000
CMD ["python","main.py"]