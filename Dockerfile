FROM python:3.8.9-slim-buster
ENV TEST={$test42}
ENV TEST2=test42
ENV TEST3={$test36}
ENV TEST4=test42
ENV TEST5=%env.test36%
#RUN echo $test42
#RUN echo $(TEST)
# ENV MODEL_URL=http://google.com
# ENV REQUIREMENTS=
WORKDIR /usr/src/app

COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install ${REQUIREMENTS}

COPY . .
# RUN скачиваем curl MODEL_URL ./models/model_10001/

EXPOSE 8000
# echo $TEST
CMD [ "sh", "./app.sh" ]