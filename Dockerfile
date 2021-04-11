FROM python:3.8.9-slim-buster
FROM alpine/git:v2.30.1
WORKDIR /opt/pipeline
COPY . .
ARG REQUIREMENTS
RUN apt install git-all
RUN git clone $REQUIREMENTS
RUN pip install --upgrade pip
RUN cd /opt/pipeline/mvp pip install -r requirements.txt
COPY requirements.txt ./
#RUN pip install ${ADDITIONAL_REQUIREMENTS}
#RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD [ "sh", "./app.sh" ]