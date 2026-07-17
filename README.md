# 🤖 Automatización de Servidores con Ansible y Docker

Este repositorio contiene un laboratorio práctico de infraestructura como código (IaC). El objetivo principal del proyecto es crear un entorno de 5 servidores virtuales utilizando **Docker** y automatizar su configuración simultánea utilizando **Ansible**.

Es un proyecto ideal para demostrar habilidades de administración de sistemas, configuración automatizada y manejo de contenedores. Práctica desarrollada para el Instituto Tecnológico de Las Américas (ITLA).

## 🛠️ Tecnologías Utilizadas
* **Docker & Docker Compose:** Para la creación rápida y estandarizada de los servidores base.
* **Ansible:** Como herramienta principal de automatización y gestión de la configuración.
* **Ubuntu 22.04:** Como sistema operativo de los nodos (servidores).

## 📂 Estructura del Proyecto
* `Dockerfile`: Receta para construir la imagen base de Ubuntu con el servidor SSH activo, el usuario `ansible` y privilegios `sudo` sin contraseña.
* `docker-compose.yml`: Orquestación para levantar 5 contenedores (servidores) exponiendo diferentes puertos locales (2201 al 2205).
* `ansible.cfg`: Archivo de configuración que define la ubicación del inventario y desactiva la validación estricta de llaves SSH.
* `inventario.ini`: Lista de los nodos administrados por Ansible, sus puertos, usuario y contraseña.
* `playbook.yml`: Guion de tareas (Tasks) que Ansible ejecuta en los servidores.

## 🚀 ¿Qué hace el Playbook?
Al ejecutarse, Ansible se conecta por SSH a los 5 contenedores y de forma automática realiza lo siguiente:
1. Actualiza los repositorios de paquetes `apt`.
2. Crea un nuevo usuario en el sistema llamado `itla`.
3. Crea un directorio raíz llamado `/app` con los permisos adecuados.
4. Genera un archivo de texto `hola.txt` dentro de la carpeta `/app` validando el éxito de la tarea.
5. Instala las aplicaciones `cowsay` y `htop`.

## ⚙️ Instrucciones de Ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/AliaJimenez/ubuntu-server-automation
   cd ubuntu-server-automation
   ```
2. **Levantar los servidores con Docker:**
  ```bash
  docker compose up -d --build
  ```
3. **Ejecutar la automatización con Ansible (desde WSL/Linux):**
  ```bash
  ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventario.ini playbook.yml
  ```
4. **Apagar y limpiar el entorno (cuando termines):**
  ```bash
  docker compose down
