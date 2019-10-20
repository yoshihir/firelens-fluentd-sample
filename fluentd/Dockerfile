FROM fluent/fluentd:v1.7-1

# Use root account to use apk
USER root

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install fluent-plugin-rewrite-tag-filter -v 2.2.0 \
 && sudo gem install fluent-plugin-s3 -v 1.1.11 \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# COPY fluent.conf /fluentd/etc/
# COPY entrypoint.sh /bin/

COPY fluent.conf /fluentd/etc/fluent-custom.conf
COPY conf.in      /fluentd/etc/conf.in
COPY conf.out     /fluentd/etc/conf.out

USER fluent