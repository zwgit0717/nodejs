FROM node:alpine3.22

# 将工作目录从 /tmp 修改为 /app，避免被 Render 的临时文件系统覆盖
WORKDIR /app

COPY index.js index.html package.json ./

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]
