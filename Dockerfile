FROM python:2.7

MAINTAINER Prakash Bhagat "https://github.com/prakashdbhagat"

RUN mkdir -p /opt/colab

WORKDIR /opt/colab

COPY requirements.txt .

RUN pip install -r requirements.txt \
    && jupyter serverextension enable --py jupyter_http_over_ws

EXPOSE 8888

CMD ["jupyter","notebook","--NotebookApp.allow_origin='https://colab.research.google.com'","--allow-root","--port","8888","--ip","0.0.0.0"]
