FROM strapi/base

EXPOSE 1337

VOLUME [ "/app/.tmp" ]

WORKDIR /app
COPY . /app
CMD ["yarn", "start"]