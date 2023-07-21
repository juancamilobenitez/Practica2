# Despliegue de un servidor web en un Registro de Contenedores de Azure utilizando Ansible y Podman

Este repositorio contiene los archivos necesarios y las instrucciones para desplegar un servidor web en un Registro de Contenedores de Azure utilizando Ansible y Podman.

## Requisitos previos

Antes de comenzar, asegúrate de tener lo siguiente instalado en tu sistema:

1. Ansible
2. Podman
3. Git

## Pasos para el despliegue

Sigue los pasos a continuación para desplegar el servidor web:

### 1. Clonar el repositorio

Clona este repositorio en tu sistema local utilizando el siguiente comando:

```bash
git clone https://github.com/tu_usuario/tu_repositorio.git
Cambia tu_usuario y tu_repositorio por tu nombre de usuario de GitHub y el nombre de tu repositorio.
```

## 2. Crear el Containerfile

En la carpeta Practica2/Ansible/roles/files, crea un archivo llamado Containerfile con el siguiente contenido:

```bash
FROM fedora:latest
RUN dnf -y install nginx && dnf clean all
COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/
EXPOSE 8080
CMD ["/usr/sbin/nginx","-c","/etc/nginx.conf"]
```
Este archivo define la configuración para construir la imagen del servidor web con Nginx usando Podman.

## 3. Ejecutar la playbook de Ansible

Ejecuta la playbook de Ansible para construir la imagen del servidor web y subirla al Registro de Contenedores de Azure. Ve al directorio Practica2/Ansible y ejecuta el siguiente comando:

```bash
ansible-playbook "nombre del playbook".yml

```
Esto ejecutará la playbook y realizará los siguientes pasos:

Construirá la imagen del servidor web utilizando el archivo Containerfile con Podman.
Iniciará sesión en el Registro de Contenedores de Azure utilizando tus credenciales.
Subirá la imagen del servidor web al Registro de Contenedores de Azure.

## 4. Verificar el despliegue
Una vez que la playbook haya finalizado con éxito, puedes verificar que la imagen del servidor web esté en el Registro de Contenedores de Azure.

## Notas adicionales

Asegúrate de tener las credenciales correctas para el Registro de Contenedores de Azure en el archivo deploy_web_server.yml:

vars:
  azure_username: "tu_usuario"
  azure_password: "tu_contraseña"




