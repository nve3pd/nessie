
FROM nimlang/nim:0.19.0

MAINTAINER Taichi Uchihara <hoge.uchihara@gmail.com>

RUN \
  git clone https://github.com/nve3pd/nessie ./nessie && cd ./nessie && git checkout develop && nimble install -y 
