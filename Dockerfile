FROM node:alpine as build
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . ./
#RUN chown -R node.node /app
CMD ["npm", "run", "buld"]

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
