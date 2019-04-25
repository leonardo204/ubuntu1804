# ubuntu1804
1. git clone https://github.com/leonardo204/docker-brew-ubuntu-core.git
2. cd docker-brew-ubuntu-core
3. ./update.sh
4. cd bionic
5. docker build --tag ubuntu1804:initial .
6. cd ..
7. git clone https://github.com/leonardo204/ubuntu1804.git
8. cd ubuntu1804
9. docker build --tag ubuntu1804:base .
