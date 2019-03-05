# install base image for debian 9
FROM ubuntu:18.04

#ENV FLASK_APP=hello.py

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# install tesseract-ocr
RUN apt-get update \
    && apt-get install tesseract-ocr -y \
    python3 \
    python3-pip \
    && apt-get clean \
    && apt-get autoremove

RUN tesseract -v

ADD . /home/app
WORKDIR /home/app
COPY requirements.txt ./
COPY . .

RUN pip3 install -r requirements.txt

ENV FLASK_APP=hello.py

RUN export LC_ALL=C.UTF-8
RUN export LANG=C.UTF-8

VOLUME ["/data"]
EXPOSE 80
#CMD ["python3", "OCRRun.py"]
#CMD ["flask", "run"]
CMD ["python3", "hello.py"]
