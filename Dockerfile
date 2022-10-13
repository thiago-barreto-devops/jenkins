FROM python:3.6
#Copiando os arquivos do projeto para o diretorio usr/src/app 
COPY . /usr/src/app
#Definindo o diretorio onde o CMD será executado e copiando o arquivo de requerimentos
WORKDIR /usr/src/app
COPY requirements.txt ./
# Instalando os requerimentos com o PIP
RUN pip install --no-cache-dir -r requirements.txt
# Expondo a porta da APP
EXPOSE 8000
# Executando o comando para subir a aplicacao
CMD ["gunicorn", "to_do.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
#teste

ARG environment
ARG repo
ENV AWS_ENV_PATH=/$repo/$environment
ENV AWS_REGION=us-east-1

RUN apk update && apk upgrade && apk add --no-cache curl openssl ca-certificates wget
RUN apk add --no-cache tzdata
ENV TZ America/Recife
