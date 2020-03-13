FROM strapi/base

EXPOSE 1337
WORKDIR /app
COPY . /app
CMD ["yarn", "start"]