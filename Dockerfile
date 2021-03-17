FROM node:14.15.1-alpine AS builder
# Create app directory
WORKDIR /app
# Install app dependencies
COPY yarn.lock package.json ./
RUN yarn install --frozen-lockfile

COPY tsconfig.json ./
COPY src ./src

RUN yarn build

# Build is done, lets clean the npm files
# RUN rm -rf .npmrc ./client/.npmrc ./__tests__/.npmrc ./client-types-template ./src

# Cleanup is done, build is finished, next stage, build lighterweight container.
FROM node:14.15.1-alpine
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 8080
CMD yarn start
