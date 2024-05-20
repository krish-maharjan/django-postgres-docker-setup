FROM python:3.12.3

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/

EXPOSE 8000

ENV PYTHONDONTWRITEBYTECODE 1
ENV ENV PYTHONBUFFERED 1

CMD ["watchmedo", "auto-restart", "--directory=.", "--pattern=*.py", "--recursive", "--", "python", "manage.py", "runserver", "0.0.0.0:8000"]