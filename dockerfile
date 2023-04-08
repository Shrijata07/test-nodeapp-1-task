FROM node:16
COPY . .
RUN npm install
RUN npm build
CMD ["npm", "start"]
EXPOSE 8080
