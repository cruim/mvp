FROM python:3.8.9-slim-buster
ENV test24=2626
#ENV TEST={$test42}
#RUN echo $test42
#RUN echo $(TEST)
# ENV MODEL_URL=http://google.com
# ENV REQUIREMENTS=
WORKDIR /usr/src/app

#COPY .env .
#RUN /bin/bash -l -c "ls -a
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install ${REQUIREMENTS}

COPY . .
ENV TESTY=.env
# RUN скачиваем curl MODEL_URL ./models/model_10001/

EXPOSE 8000
# echo $TEST
CMD [ "sh", "./app.sh" ]