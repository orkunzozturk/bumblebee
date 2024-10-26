# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock to install dependencies first
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --production

# Copy the rest of the application files
COPY . .

# Build the Astro app
RUN yarn build

# Expose the app's port
EXPOSE 4321

# Define environment variables and start command
ENV HOST=0.0.0.0
CMD ["node", "dist/server/entry.mjs"]

