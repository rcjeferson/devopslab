FROM python:3

RUN adduser --system --home /app devopslab
USER devopslab

WORKDIR /app

ENV PATH="/app/.local/bin:${PATH}"

COPY --chown=devopslab:nogroup app.py requirements.txt /app

RUN pip install --user --trusted-host pypi.python.org -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]