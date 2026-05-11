# Innovatech Chile - Database Layer (Equipo Caltías) 📊 

[cite_start]Este componente gestiona la persistencia crítica de los usuarios y estadísticas del sistema Innovatech Chile utilizando MariaDB/MySQL[cite: 26, 60].

## 💾 Persistencia Avanzada (IE3)
[cite_start]Se implementaron **Named Volumes** para garantizar que los datos sobrevivan al ciclo de vida de los contenedores[cite: 33, 157]:
- [cite_start]**Configuración:** Volumen `mysql_data` mapeado a `/var/lib/mysql` dentro del contenedor[cite: 33, 169].
- [cite_start]**Justificación:** Se seleccionó el uso de volúmenes nombrados sobre bind mounts para permitir que Docker gestione el almacenamiento de forma eficiente y segura, facilitando backups y migraciones[cite: 35, 99].

## 🐳 Despliegue Contenerizado (IE2)
[cite_start]La base de datos se integra al stack completo mediante el archivo `docker-compose.yml` definido en el proyecto[cite: 30, 139]:
- [cite_start]**Dependencias:** El servicio Backend está configurado para esperar la disponibilidad de la base de datos antes de iniciar[cite: 139].
- [cite_start]**Redes:** Aislamiento total en red privada; el acceso externo está bloqueado por diseño[cite: 173, 175].

## 🛡️ Seguridad Perimetral (IE7)
[cite_start]El acceso a los datos está restringido bajo el modelo de defensa en profundidad[cite: 140, 150]:
- [cite_start]**Security Groups:** Reglas de entrada configuradas para permitir tráfico ÚNICAMENTE desde la instancia de Backend por el puerto 3306[cite: 73, 171].
- [cite_start]**Acceso Administrativo:** Solo habilitado mediante SSH desde el Jump Host autorizado[cite: 173].

## 🔄 Automatización (IE4)
[cite_start]Al igual que el resto del sistema, la base de datos se despliega mediante **GitHub Actions** cada vez que se actualiza la rama `deploy`, asegurando que los esquemas y datos de configuración estén siempre actualizados en la nube de AWS[cite: 113, 174].