FROM pytorch/torchserve:latest-gpu
USER root
RUN apt-get update && apt-get install -y espeak-ng git && rm -rf /var/lib/apt/lists/*
RUN --mount=type=bind,source=requirements.txt,target=/app/requirements.txt pip install -r /app/requirements.txt && rm -rf /root/.cache/pip && python -m nltk.downloader punkt_tab
ENTRYPOINT [ "torchserve", "--start" ]
