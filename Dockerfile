# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /myapp

# Copy the current directory contents into the container
COPY . .

# Install required Python packages from requirements.txt
# Fix the typo "requirements.text" to "requirements.txt"
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Collect static files for Django
RUN python manage.py collectstatic --noinput

# Apply Django migrations
RUN python manage.py migrate

# Expose port 8000 for Django
EXPOSE 8000

# Set environment variables to improve Docker performance
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
