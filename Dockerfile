FROM python:3.8.9-slim-buster
WORKDIR /opt/pipeline
COPY . .
ARG requirements
ENV ADDITIONAL_REQUIREMENTS=${requirements}
COPY requirements.txt ./
RUN pip install ${ADDITIONAL_REQUIREMENTS}
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD [ "sh", "./app.sh" ]