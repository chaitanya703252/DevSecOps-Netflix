# 1. Use Node.js base image
FROM node:18-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy package files first (for caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy application source code
COPY . .

# 6. Build the React app
RUN npm run build

# 7. Install serve to run the build
RUN npm install -g serve

# 8. Expose application port
EXPOSE 3000

# 9. Start the application
CMD ["serve", "-s", "build", "-l", "3000"]

