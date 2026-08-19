FROM nginx:1.27-alpine
COPY nakout.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
