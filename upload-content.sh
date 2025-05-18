#!/bin/bash

# Obtener el nombre de la cuenta de almacenamiento
STORAGE_ACCOUNT_NAME=$(az deployment group show \
  --name FinTechDeployment \
  --resource-group FinTechResourceGroup \
  --query properties.outputs.storageAccountName.value \
  --output tsv)

STORAGE_ACCOUNT_ID=$(az storage account show \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group FinTechResourceGroup \
  --query id \
  --output tsv)

# Asignar el rol "Storage Blob Data Contributor" a tu usuario
az role assignment create \
  --role "Storage Blob Data Contributor" \
  --assignee "fernandogabriel.alvear236@comunidadunir.net" \
  --scope $STORAGE_ACCOUNT_ID

# Crear directorio para los archivos web si no existe
mkdir -p /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/video

# Crear los archivos HTML y CSS
cat > /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/index.html << 'EOL'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FinTech Solutions S.A.</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>FinTech Solutions S.A.</h1>
        <nav>
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Servicios</a></li>
                <li><a href="#">Acerca de</a></li>
                <li><a href="#">Contacto</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section class="hero">
            <h2>Este es nuestro sitio web</h2>
            <p>Innovando tecnológicamente</p>
        </section>
        
        <section class="video-section">
            <h2>Nuestro Video Corporativo</h2>
            <video controls width="640" height="360">
                <source src="video/corporate.mp4" type="video/mp4">
                Su navegador no soporta el elemento de video.
            </video>
        </section>
        
        <section class="services">
            <h2>Nuestros Servicios</h2>
            <div class="service-grid">
                <div class="service-card">
                    <h3>Pagos Digitales</h3>
                    <p>Soluciones de pago seguras y eficientes para empresas de todos los tamaños.</p>
                </div>
                <div class="service-card">
                    <h3>Gestión Financiera</h3>
                    <p>Herramientas avanzadas para optimizar sus operaciones financieras.</p>
                </div>
                <div class="service-card">
                    <h3>Análisis Predictivo</h3>
                    <p>Inteligencia artificial aplicada a la predicción de tendencias financieras.</p>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FinTech Solutions S.A. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
EOL

cat > /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/styles.css << 'EOL'
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    color: #333;
}

header {
    background-color: #0066cc;
    color: white;
    padding: 1rem 2rem;
}

header h1 {
    margin-bottom: 1rem;
}

nav ul {
    display: flex;
    list-style: none;
}

nav ul li {
    margin-right: 1rem;
}

nav ul li a {
    color: white;
    text-decoration: none;
}

main {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem;
}

.hero {
    text-align: center;
    margin-bottom: 3rem;
}

.hero h2 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    color: #0066cc;
}

.video-section {
    text-align: center;
    margin-bottom: 3rem;
}

.video-section h2 {
    margin-bottom: 1.5rem;
    color: #0066cc;
}

.services h2 {
    text-align: center;
    margin-bottom: 2rem;
    color: #0066cc;
}

.service-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
}

.service-card {
    background-color: #f5f5f5;
    padding: 2rem;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.service-card h3 {
    margin-bottom: 1rem;
    color: #0066cc;
}

footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 1rem;
    margin-top: 2rem;
}

video {
    max-width: 100%;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}
EOL

cat > /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/error.html << 'EOL'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Página no encontrada</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .error-container {
            text-align: center;
            padding: 5rem 2rem;
        }
        .error-container h1 {
            font-size: 4rem;
            color: #cc0000;
            margin-bottom: 1rem;
        }
        .error-container p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }
        .btn {
            display: inline-block;
            background-color: #0066cc;
            color: white;
            padding: 0.75rem 1.5rem;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <h1>FinTech Solutions S.A.</h1>
    </header>
    
    <main>
        <div class="error-container">
            <h1>404</h1>
            <p>Lo sentimos, la página que buscas no existe.</p>
            <a href="index.html" class="btn">Volver al inicio</a>
        </div>
    </main>
    
    <footer>
        <p>&copy; 2023 FinTech Solutions S.A. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
EOL

# Descargar un video de ejemplo si no existe
if [ ! -f /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/video/corporate.mp4 ]; then
  echo "Descargando un video de ejemplo..."
  curl -L "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_2mb.mp4" -o /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/video/corporate.mp4
fi

# Subir los archivos HTML y CSS individualmente
echo "Subiendo archivo index.html..."
az storage blob upload \
  --account-name $STORAGE_ACCOUNT_NAME \
  --auth-mode login \
  --container-name '$web' \
  --file /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/index.html \
  --name index.html \
  --content-type "text/html" \
  --overwrite

echo "Subiendo archivo error.html..."
az storage blob upload \
  --account-name $STORAGE_ACCOUNT_NAME \
  --auth-mode login \
  --container-name '$web' \
  --file /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/error.html \
  --name error.html \
  --content-type "text/html" \
  --overwrite

echo "Subiendo archivo styles.css..."
az storage blob upload \
  --account-name $STORAGE_ACCOUNT_NAME \
  --auth-mode login \
  --container-name '$web' \
  --file /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/styles.css \
  --name styles.css \
  --content-type "text/css" \
  --overwrite

# Subir el video (mantener este código)
echo "Subiendo video..."
az storage blob upload \
  --account-name $STORAGE_ACCOUNT_NAME \
  --auth-mode login \
  --container-name '$web' \
  --file /Volumes/BACKUP/Projects/Azure-DevOps/fintech-web/video/corporate.mp4 \
  --name video/corporate.mp4 \
  --content-type "video/mp4" \
  --overwrite

# Obtener la URL del sitio web estático
STATIC_WEBSITE_URL=$(az deployment group show \
  --name FinTechDeployment \
  --resource-group FinTechResourceGroup \
  --query properties.outputs.staticWebsiteUrl.value \
  --output tsv)

echo "Archivos subidos correctamente."
echo "URL del sitio web estático: $STATIC_WEBSITE_URL"
echo "Nota: El contenido puede tardar unos minutos en estar disponible."