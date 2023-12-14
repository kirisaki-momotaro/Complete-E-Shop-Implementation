FROM node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV PORT=5101
EXPOSE 5101
CMD [ "npn","start" ]