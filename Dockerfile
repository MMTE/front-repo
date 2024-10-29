# Use a Node.js image as the base
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy the package files and install dependencies
COPY package*.json ./

RUN npm install react-markdown && \
    npm install
RUN npm install serve -g

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# Set the environment to production
ENV NODE_ENV=production

# Expose the port that Next.js will run on
EXPOSE 3000

# Start the Next.js application
#CMD ["serve", "build -s"]
ENTRYPOINT ["serve", "-s", "build"]
