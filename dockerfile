FROM node:16
COPY . .
RUN npm install
CMD ["npm", "start"]
EXPOSE 3000
