FROM debian:stretch-slim
MAINTAINER skaparate <poetadelosmuertos (at) gmail (dot) com>
MAINTAINER floppydisk <floppydisk@zepto.vn>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing

# Install utitilities and required software
RUN apt-get -q -y install curl net-tools gcc g++ vim less make cron

# Download and run XAMPP installer
COPY xampp xampp.sha
RUN curl -o xampp-linux-x64-7.2.7-0-installer.run "https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/7.2.7/xampp-linux-x64-7.2.7-0-installer.run?from_af=true"
RUN sha1sum --status -c xampp.sha

RUN mv xampp-linux-x64-7.2.7-0-installer.run xampp.run
RUN chmod +x xampp.run
RUN bash -c './xampp.run' && \
    ln -sf /opt/lampp/lampp /usr/bin/lampp
# Create a /www folder and a symbolic link to it in /opt/lampp/htdocs. It'll be accessible via http://localhost:[port]/www/
# This is convenient because it doesn't interfere with xampp, phpmyadmin or other tools in /opt/lampp/htdocs
RUN mkdir /app && \
    mkdir -p /var/run/sshd && \
    ln -s /app /opt/lampp/htdocs/

VOLUME [ "/var/log/mysql/", "/var/log/apache2/" ]

# Install PCRE
RUN curl -o pcre2.tar.gz "https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz" && \
    mkdir pcre2 && \
    tar -xf pcre2.tar.gz -C pcre2 --strip-components=1 && \
    cd pcre2 && \
    ./configure --prefix=/opt/lampp --enable-utf8 --enable-unicode-properties && \
    make && \
    make install

# write a startup script and utilities
RUN echo '/opt/lampp/lampp start' >> /startup.sh && \
    ln -sT /opt/lampp /root/lampp && \
    rm ./xampp.run && \
    ln -s /opt/lampp/bin/php /usr/bin/

# Extra data folder
RUN mkdir -p /xampp/data/composer

# Install composer
ENV COMPOSER_HOME /xampp/data/composer
COPY composer-install ./
RUN chmod +x composer-install
RUN bash -c './composer-install'

# phantomjs
RUN apt-get install -q -y libfontconfig1 libfontconfig1-dev
RUN apt-get install -q -y phantomjs
RUN apt-get install -q -y xvfb
RUN apt-get update && \
    apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
    libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
    libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
    libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
    ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

RUN apt-get clean
# Execute mysql installation

CMD ["sh", "/startup.sh"]

EXPOSE 80
