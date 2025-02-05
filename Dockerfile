# Multi-stage Dockerfile for Efficiency & Security

# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm ci --only=production

# Copy application source
COPY . .

# Stage 2: Run
FROM node:18-alpine AS runtime
WORKDIR /app

# Copy only the built files and dependencies from the builder stage
COPY --from=builder /app /app

# Set environment variables
ENV NODE_ENV=production
ENV PORT=5050

# Expose the application port
EXPOSE 5050

# Use a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Start the application
CMD ["node", "server.js"]
