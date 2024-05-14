# Use the official Python image from the Docker Hub
FROM python:3.12

# Install required packages for the SDK
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    unzip \
    libcurl4-openssl-dev \
    libssl-dev

# Install the VirtualBox SDK
RUN wget https://download.virtualbox.org/virtualbox/6.1.34/VirtualBoxSDK-6.1.34-150636.zip
RUN unzip VirtualBoxSDK-6.1.34-150636.zip -d /opt
ENV VBOX_SDK_PATH /opt/VirtualBoxSDK-6.1.34-150636

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . /app
WORKDIR /app

# Run the application
CMD ["python", "vboxpower.py"]

