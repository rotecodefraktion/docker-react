FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . ./
#RUN chown -R node.node /app
CMD ["npm", "run", "build"]

FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html
