FROM python:3.9

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip
#
#RUN adduser -D myuser
#USER myuser
#WORKDIR /home/myuser
#
#COPY --chown=myuser:myuser requirements.txt requirements.txt
#RUN pip install --user -r requirements.txt
#
#ENV PATH="/home/myuser/.local/bin:${PATH}"
#
#COPY --chown=myuser:myuser . .




WORKDIR /usr/src/app
COPY requirements.txt ./

RUN python3 -m venv /opt/venv

RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

