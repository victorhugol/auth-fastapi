FROM python:3.8-slim


# RUN groupadd --gid 5000 victor \
#     && useradd --home-dir /home/victor --create-home --uid 5000 \
#     --gid 5000 --shell /bin/sh --skel /dev/null victor

USER root

ADD ./requirements.txt /app/

WORKDIR /app/
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./src /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0","--reload","--port" ,"8080"]