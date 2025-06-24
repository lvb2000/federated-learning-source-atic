# Dockerfile
FROM python:3.6

# Set environment variables for Jupyter
ENV JUPYTER_PORT=8888
ENV HOME=/usr/src/app

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/

# Install pip dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Jupyter port
EXPOSE ${JUPYTER_PORT}

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]