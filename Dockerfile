# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM node:lts-alpine

WORKDIR /app

# Copy package manifests
COPY package.json package-lock.json ./

# Install dependencies (ignore scripts to speed up build if necessary)
RUN npm install --ignore-scripts

# Copy the rest of the code
COPY . .

# Build the project
RUN npm run build

# Expose port if necessary (not needed for stdio MCP server), but leaving comment
# EXPOSE 3000

# Run the server
CMD ["npm", "start"]
