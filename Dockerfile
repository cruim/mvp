FROM python:3.8.9-slim-buster
WORKDIR /opt/pipeline
COPY . .
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
ARG REQUIREMENTS
ARG BRANCH=master
RUN git clone -b $BRANCH $REQUIREMENTS additional_params
RUN pip install --no-cache-dir -r /opt/pipeline/additional_params/requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD [ "sh", "./app.sh" ]