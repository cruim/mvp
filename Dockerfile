FROM python:3.8.9-slim-buster
WORKDIR /opt/pipeline
COPY . .
ARG REQUIREMENTS
RUN git clone REQUIREMENTS
RUN pip install --upgrade pip
RUN cd /opt/pipeline pip install --no-cache-dir -r requirements.txt
COPY requirements.txt ./
#RUN pip install ${ADDITIONAL_REQUIREMENTS}
#RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD [ "sh", "./app.sh" ]