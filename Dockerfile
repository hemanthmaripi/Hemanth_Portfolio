# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the app (for React)
RUN npm run build

# Expose port (change if your app uses a different port)
EXPOSE 3000

# Start the app (for React static build using serve)
RUN npm install -g serve
CMD ["serve", "-s", "build", "-l", "3000"]
