# Use an official Python runtime as the base image
FROM python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt /app/

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project code into the container
COPY . /app/

# Expose the port that Django runs on
EXPOSE 8000

# Define the command to run when the container starts
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Run Gunicorn with your Django app as the entry point
CMD ["gunicorn", "library.wsgi:application", "--bind", "0.0.0.0:8000"]
