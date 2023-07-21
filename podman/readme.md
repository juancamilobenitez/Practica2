# Despliegue de Contenedor Web en Azure con Podman De manera Manual (la automatica esta en la carpeta Ansible)

Este repositorio contiene los archivos y comandos necesarios para desplegar un contenedor web en Microsoft Azure utilizando Podman.

## Paso 1: Crear la Máquina Virtual en Azure

1. Crear una nueva Máquina Virtual en Azure con el sistema operativo Linux (CentOS).
2. Asegurarse de que la Máquina Virtual tenga una dirección IP pública asignada para poder acceder al servidor web.

## Paso 2: Instalar Podman en la Máquina Virtual

1. Conectarse a la Máquina Virtual a través de SSH utilizando la clave privada proporcionada.
2. Instalar Podman en la Máquina Virtual ejecutando los siguientes comandos:

```bash
sudo yum update -y
sudo yum install -y podman

## Paso 3: Crear un Contenedor Web con Podman

1. Crear un directorio en la Máquina Virtual para almacenar los archivos del contenedor:

```bash

mkdir webserver
cd webserver

```

2. Crear un archivo Dockerfile o Containerfile con las instrucciones para construir el contenedor web. Por ejemplo:

```bash

FROM nginx:latest
COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

```

Crear el archivo "index.html" con el contenido que deseas mostrar en el servidor web.
Crear el archivo "nginx.conf" con la configuración deseada para el servidor NGINX.

## Paso 4: Construir y Ejecutar el Contenedor Web

1. Construir la imagen del contenedor con Podman:

```bash

podman build -t webserver
```


## Paso 5: Etiquetar y subir imagen

1. Etiquetar la imagen:

```bash
podman tag fedora practicasegunda.azurecr.io/contenedor1:latest

```

2. Iniciar sesión en el registro de Azure:

```bash

podman login REGISTRY_NOMBRE.azurecr.io

```

3. Subir la etiqueta

```bash
podman push practicasegunda.azurecr.io/contenedor1:latest

```
