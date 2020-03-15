pipeline {
  agent any
  stages {
    stage('检出') {
      steps {
        checkout([
          $class: 'GitSCM', branches: [[name: env.GIT_BUILD_REF]],
          userRemoteConfigs: [[
            url: env.GIT_REPO_URL,
            credentialsId: env.CREDENTIALS_ID
          ]]
        ])
      }
    }
    stage('编译') {
      steps {
        script {
          docker.image('strapi/base').withRun {
            docker.image("strapi/base").inside {
              sh 'node -v && yarn --version && yarn install && NODE_ENV=production yarn build'
            }
          }
        }

      }
    }
    stage('打包镜像') {
      steps {
        script {
          sh "docker build -t strapi:${env.GIT_BUILD_REF} -t gongbaodd-docker.pkg.coding.net/query_gongbushang_com/docker/strapi:latest ."
        }

      }
    }
    stage('发布') {
      steps {
        script {
            sh "docker login -u ${env.REGISTRY_USER} -p ${env.REGISTRY_PASS} ${REGISTRY_URL}"
            sh "docker push ${REGISTRY_URL}/query_gongbushang_com/docker/strapi:latest"
        }
      }
    }
  }
}