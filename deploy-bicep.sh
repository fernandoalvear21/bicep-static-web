#!/bin/bash

# Iniciar sesión en Azure
az login

# Crear un grupo de recursos (si no existe)
az group create --name FinTechResourceGroup --location eastus

# Implementar el archivo Bicep
az deployment group create \
  --name FinTechDeployment \
  --resource-group FinTechResourceGroup \
  --template-file fintech-storage.bicep

# Habilitar el sitio web estático 
STORAGE_ACCOUNT_NAME=$(az deployment group show \
  --name FinTechDeployment \
  --resource-group FinTechResourceGroup \
  --query properties.outputs.storageAccountName.value \
  --output tsv)

az storage blob service-properties update \
  --account-name $STORAGE_ACCOUNT_NAME \
  --static-website \
  --index-document index.html \
  --404-document error.html

echo "Implementación completada."
echo "Ahora puedes subir tus archivos web al contenedor \$web de la cuenta de almacenamiento."