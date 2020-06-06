FROM strapi/strapi

EXPOSE 1337

ENV NODE_ENV=production

WORKDIR /app
COPY . /app
CMD ["yarn", "start"]