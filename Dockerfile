FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="PHP Weathermap Manual"
LABEL org.opencontainers.image.description="Offline copy of the PHP Weathermap v0.98a manual (network-weathermap.com)"
LABEL org.opencontainers.image.licenses="MIT"

COPY site/ /usr/share/nginx/html/

# Small tuning: gzip + cache for images
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://127.0.0.1:8080/manual/pages/main.html >/dev/null || exit 1
