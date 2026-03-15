FROM nginx:1.25-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
# COPY certs/ /etc/nginx/certs/     <-- ใส่ # ปิดบรรทัดนี้ไว้
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]