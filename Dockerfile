FROM python:3.12

WORKDIR /app

RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ai_model/stt_ru_conformer_ctc_large.nemo /app/ai_model/stt_ru_conformer_ctc_large.nemo || true

COPY . .

EXPOSE 8003

CMD ["python", "app.py"]
