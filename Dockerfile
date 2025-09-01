# Imagen base con Python ≥ 3.9
FROM python:3.11-slim

# Directorio de trabajo
WORKDIR /app

# Copiamos requirements y los instalamos
COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

# Copiamos la app y el modelo
COPY ./app.py .
COPY ./model ./model

# Comando para correr FastAPI con Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
