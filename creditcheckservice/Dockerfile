FROM python:3.9-slim

# Set working directory
WORKDIR /app


COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy main app
COPY main.py .

# Set the entrypoint command to run the application
CMD ["python3", "main.py"]
