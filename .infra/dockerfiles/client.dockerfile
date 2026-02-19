###################
# DEVELOPMENT
###################
FROM node:22 AS development

WORKDIR /usr/src/client

# Install dependencies
COPY package*.json ./

RUN npm install

# Copy source code
COPY . .

# Expose port for Angular development server
EXPOSE 4200

# Command for development mode
# CMD ["npm", "run", "start"]


###################
# PRODUCTION
###################
FROM node:22 AS build

WORKDIR /usr/src/client

# Copy package.json and install only production dependencies
COPY --chown=node:node package*.json ./

RUN npm ci

COPY --chown=node:node . .

RUN npm run build

USER node


FROM nginx:stable AS production

COPY --from=build /usr/src/client/dist/sh-client/browser /usr/share/nginx/html

RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80


