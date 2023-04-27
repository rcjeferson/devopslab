FROM python:3

WORKDIR /app

COPY . /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8000" "app:app"]