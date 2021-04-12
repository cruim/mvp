FROM python:3.8.9-slim-buster
WORKDIR /opt/pipeline
COPY . .
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
ARG REQUIREMENTS
RUN git clone $REQUIREMENTS
RUN pip install --no-cache-dir -r /opt/pipeline/mvp/requirements.txt
COPY requirements.txt ./
RUN export MODEL=$(cat /opt/pipeline/mvp/requirements.txt)
#RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD [ "sh", "./app.sh" ]