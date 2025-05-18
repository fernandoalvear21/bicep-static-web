@description('Ubicación para todos los recursos.')
param location string = resourceGroup().location

@description('Nombre de la cuenta de almacenamiento')
param storageAccountName string = 'dlsfintechstorageweb'

@description('SKU de la cuenta de almacenamiento')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param storageSku string = 'Standard_LRS'

// Definir la cuenta de almacenamiento
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: true
    minimumTlsVersion: 'TLS1_2'
  }
}

// Habilitar el sitio web estático
resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2021-08-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      enabled: false
    }
  }
}

// Configurar el sitio web estático
resource staticWebsite 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = {
  parent: blobService
  name: '$web'
  properties: {
    publicAccess: 'None'
  }
}

// Outputs para obtener las URLs
output storageAccountName string = storageAccount.name
output staticWebsiteUrl string = 'https://${storageAccountName}.z13.web.core.windows.net'