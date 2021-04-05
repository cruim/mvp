FROM python:3.8.9-slim-buster

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# RUN chmod +x
#
# ENTRYPOINT "./app.sh"

CMD [ "sh", "./app.sh" ]