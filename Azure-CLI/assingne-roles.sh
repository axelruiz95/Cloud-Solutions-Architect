# Configuración inicial
STORAGE_ACCOUNT_NAME="storaname"
RESOURCE_GROUP_NAME="miGrupoDeRecursos"
USER_EMAIL="axel@fors.com"
ROLES=(
    "Reader and Data Access"
  #Asigne los roles necesarios entre comillas
)

# Aqui obtienes el ID del Storage Account
SCOPE=$(az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --query "id" -o tsv)

# Aqui obtienes el ObjectId del usuario
OBJECT_ID=$(az ad user show --id $USER_EMAIL --query "id" -o tsv)

# Aqui asignas losroles
for ROLE in "${ROLES[@]}"; do
    echo "Asignando rol: $ROLE al usuario $USER_EMAIL"
    az role assignment create --assignee $OBJECT_ID --role "$ROLE" --scope $SCOPE || echo "Error al asignar el rol: $ROLE"
done
