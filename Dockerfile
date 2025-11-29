FROM node:20-alpine

# Install vsce globally
RUN npm install -g @vscode/vsce

# Set working directory
WORKDIR /workspace

# Copy package files first for better layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Generate syntax files from template
RUN npm run generate-syntax

# Compile TypeScript
RUN npm run compile

# The .vsix file will be output to dist/ when container runs
CMD ["sh", "-c", "vsce package -o dist/ --allow-star-activation --skip-license && ls -lh dist/*.vsix"]
