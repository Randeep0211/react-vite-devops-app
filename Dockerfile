#Stage-1
# Import base image
FROM node:23 AS development

# Create a Work Directory
WORKDIR /app

#Copying package json and package-lock json
COPY package*.json ./

# Install node node packages
RUN npm install

# Stage-2

FROM node:23-alpine

# Setup Work Directory
WORKDIR /app

# Copying entire project
COPY . .

# Copying the files from initialImage
COPY --from=development /app/node_modules ./node_modules

# Exposing Port 
EXPOSE 5173

# Entry Point
ENTRYPOINT [ "npm", "run" ]

# CMD to run project
CMD ["dev"]