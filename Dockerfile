FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production || npm install --only=production

COPY . .

# FuruWatcher.js is the entrypoint per README
CMD ["node", "FuruWatcher.js"]
