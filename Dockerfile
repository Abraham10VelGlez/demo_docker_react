# Usa una imagen base de Node.js
FROM node:16-alpine
# Instala nodemon globalmente
RUN yarn global add nodemon
# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo package.json y yarn.lock
COPY package.json yarn.lock ./

# Instala las dependencias del proyecto
RUN yarn install

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto que usará la aplicación back
EXPOSE 3000

# Expone el puerto que usará la aplicación front
EXPOSE 5173

# Comando por defecto para iniciar la aplicación en modo desarrollo
CMD ["yarn", "dev"]


# Usa una imagen de Nginx para servir la aplicación
#FROM nginx:1.27.0-alpine as stablea
# Copia los archivos react desde la etapa de construcción
#COPY client/ /usr/share/nginx/html
# Expone el puerto 80 para que se pueda acceder a la aplicación desde el exterior
#COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

#EXPOSE 80

#CMD [ "nginx" , "-g" , "daemon off;" ]

# Usa una imagen de Nginx para servir la aplicación
####################################################################FROM nginx:1.27.0-alpine as prod-stage
# Copia los archivos construidos desde la etapa de construcción
#COPY --from=build /app/build /usr/share/nginx/html
#FROM nginx
#####################################################################COPY client /usr/share/nginx/html
# Expone el puerto 80 para que se pueda acceder a la aplicación desde el exterior
#EXPOSE 80



#comandos para ejecutar este archivo
#docker build -t nombredeimagenservidor .
#docker images
#COORRER IMAGENCREADA RUN -d -p PUERTO nombredeimagenservidor
#docker run -d -p 7070:80 reactdocker
#LISTAR CONTENEDORES
#docker ps
#DETENEER IMAGEN DE NGIX
#docker stop 325