FROM node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV PORT=5100
EXPOSE 5100
CMD [ "npn","start" ]