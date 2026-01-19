FROM python:3.11-slim-bullseye

WORKDIR /app
COPY . /app

# Corrected syntax: added 'apt' before install and cleaned up
RUN apt-get update -y && apt-get install -y awscli

RUN pip install -r requirements.txt
CMD ["python3", "application.py"]




# FROM python:3.11-slim-bullseye

# WORKDIR /app

# # 1. Install system dependencies first
# RUN apt-get update && apt-get install -y awscli && rm -rf /var/lib/apt/lists/*

# # 2. Copy EVERYTHING first (so pip can see the project for '-e .')
# COPY . /app

# # 3. Install requirements
# # If you removed '-e .' from the file, this will be much faster.
# RUN pip install --no-cache-dir -r requirements.txt

# # 4. Run the app
# CMD ["python3", "application.py"]






# FROM python:3.11-slim-bullseye

# # Set work directory
# WORKDIR /app

# # Copy only requirements first (Better for caching)
# COPY requirements.txt .

# # Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Install AWS CLI correctly
# RUN apt-get update && apt-get install -y awscli

# # Copy the rest of the application
# COPY . .

# # Command to run your app
# CMD ["python3", "app.py"]

# # FROM python:3.11-slim-bullseye

# # WORKDIR /app
# # COPY . /app

# # # Corrected syntax: added 'apt' before install and cleaned up
# # RUN apt-get update -y && apt-get install -y awscli

# # RUN pip install -r requirements.txt
# # CMD ["python3", "app.py"]
# # Use Bullseye to avoid the 404 repository errors