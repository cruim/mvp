FROM python:3.8.9-slim-buster
ENV test24=2626
ARG ARG_VALUE=DEFAULT_ARG_VALUE_IF_NOT_SPECIFIED
ENV TEST_TEST=${ARG_VALUE}
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /opt/pipeline
COPY . .
ENV KUBECONFIG=/tmp
EXPOSE 8000
CMD [ "sh", "./app.sh" ]