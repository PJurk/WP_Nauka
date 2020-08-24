WORKDIR=./app

if [ ! -d $WORKDIR ]
then
    mkdir $WORKDIR
    cd app
    curl https://wordpress.org/latest.tar.gz --output wordpress.tar.gz
    tar -xzvf wordpress.tar.gz
    mv wordpress/* .
    rm -d wordpress
    rm -f wordpress.tar.gz
    cd ..
    docker-compose up -d --build
else
    docker-compose up -d
fi