# Stage 1: Build
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Create the final image
FROM node:20-alpine
WORKDIR /app

# Copy the built application from the previous stage
COPY --from=build /app /app


# Expose the port on which the app will run
EXPOSE 3000

# Run the application
CMD ["node", "index.js"]