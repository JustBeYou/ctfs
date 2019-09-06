FROM python:3

RUN pip3 install uwsgi flask
RUN apt update && apt install -y \
    ghostscript \
    imagemagick
RUN useradd emoji_kai && \
    mkdir -p /srv/emoji_kai
ADD flag /flag
ADD app.py /srv/emoji_kai/app.py
ADD templates /srv/emoji_kai/templates
ADD uwsgi.ini /srv/emoji_kai/uwsgi.ini
ADD policy.xml /etc/ImageMagick-6/policy.xml
RUN chown root:emoji_kai /flag && chmod 0440 /flag && \
    chown root:emoji_kai -R /srv/emoji_kai/app.py && chmod -R 0440 /srv/emoji_kai/app.py && \
    chown root:emoji_kai -R /srv/emoji_kai/templates && chmod -R 0750 /srv/emoji_kai/templates && \
    chown root:emoji_kai -R /srv/emoji_kai/templates/index.html && chmod -R 0440 /srv/emoji_kai/templates/index.html && \
    chown root:emoji_kai -R /srv/emoji_kai/uwsgi.ini && chmod -R 0440 /srv/emoji_kai/uwsgi.ini && \
    chown root:emoji_kai -R /etc/ImageMagick-6/policy.xml && chmod 0644 /etc/ImageMagick-6/policy.xml
CMD uwsgi --ini /srv/emoji_kai/uwsgi.ini
