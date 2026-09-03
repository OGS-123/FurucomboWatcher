FROM node:20-alpine

WORKDIR /app

# Install deps first for better caching
COPY package*.json ./
RUN npm install --only=production

# Copy rest of code
COPY . .

# Make it read ENV from Bunny / Docker / GHCR
ENV INFURA_ID=""

# Health check - not needed but good for Bunny
LABEL org.opencontainers.image.source="https://github.com/OGS-123/FurucomboWatcher"
LABEL org.opencontainers.image.description="Furucombo Proxy arbitrage watcher bot"
LABEL org.opencontainers.image.licenses="MIT"

CMD ["node", "FuruWatcher.js"]
