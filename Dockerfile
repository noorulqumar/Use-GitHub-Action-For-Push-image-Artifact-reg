FROM nginx:alpine3.18


RUN echo "Hello World!" > /usr/share/nginx/html/index.html