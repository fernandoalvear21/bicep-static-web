# Despliegue automatizado de web estática con Bicep
Este proyecto implementa una solución de almacenamiento en Azure para FinTech Solutions S.A., que incluye:

- Cuenta de almacenamiento con sitio web estático
- Alojamiento de contenido web
- Almacenamiento de objetos para videos
## Estructura del proyecto
├── .gitignore                # Archivos ignorados por Git
├── README.md                 # Este archivo de documentación
├── deploy-bicep.sh           # Script para desplegar la infraestructura
├── fintech-storage.bicep     # Plantilla de infraestructura como código
├── fintech-web/              # Archivos del sitio web estático
│   ├── error.html            # Página de error 404
│   ├── index.html            # Página principal
│   ├── styles.css            # Estilos CSS
│   └── video/                # Directorio para archivos multimedia
│       └── corporate.mp4     # Video corporativo
└── upload-content.sh         # Script para subir contenido web

## Requisitos previos
- Aure CLI
- Suscripción a Azure
- Bash o terminal compatible con Bash

## Despliegue de la infraestructura
El proyecto usa Azure Bicep para definir y desplegar la infraestructura necesaria: 
1. Clona el repositorio:
```bash
git clone https://github.com/fernandoalvear21/bicep-static-web.git
````
2. Ejecuta el script de despliegue:
```bash
./deploy-bicep.sh
```
Este script realiza lo siguiente:
- Autentica con Azure CLI
- Crea un grupo de recursos
- Despliega la plantilla de Bicep que define la cuenta de almacenamiento y el sitio web
- Habilita las características de sitio web estático

3. Subida de contenido web
El script upload-content.sh se utiliza para subir el contenido web estático a la cuenta de almacenamiento:
```bash
./upload-content.sh
```
Este script realiza las siguientes acciones:
- Asigna permisos necesarios para la cuenta de almacenamiento
- Crea los archivos HTML, CSS y descarga un video de ejemplo
- Sube los archivos al contenedor $web de la cuenta de almacenamiento
- Configura los tipos MIME correctos para cada archivo
- Muestra la URL del sitio web estático

# Mantenimiento
Para actualizar el contenido web, simplemente modifica los archivos en el directorio fintech-web y ejecuta el script upload-content.sh.

## Notas adicionales
- La URL del sitio web sigue el formato: https://{nombre-cuenta}.z13.web.core.windows.net
- El contenido puede tardar unos minutos en estar disponible después de la subida.

## Colaboración
Si deseas contribuir a este proyecto, por favor crea un pull request con tus cambios.

# Autor
- The IT Guy 