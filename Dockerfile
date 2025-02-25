# Use Node.js 20 image as the base image
FROM node:18.19.1

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./
COPY yarn.lock ./


# Install dependencies
RUN yarn install

# Copy the entire project into the container
COPY . .

# Expose the port that the application will run on
EXPOSE 3000

# Define an environment variable
ENV NODE_OPTIONS=--openssl-legacy-provider

# CMD cp .env.selena .env && yarn start
# ENTRYPOINT ["sh", "-c", "cp .env.selena .env && yarn start"]


# docker build -t staking-launchpad .
# docker run -p 3000:3000 staking-launchpad
# docker run -p 3000:3000 -it staking-launchpad bash
# cp .env.mainnet .env