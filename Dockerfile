FROM node:alpine 
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . .
#RUN chown -R node.node /app
CMD ["npm", "run", "buld"]

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
