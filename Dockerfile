FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY . .

# COPY .    .
#      from to