FROM httpd

# Install necessary programs
RUN apt-get update && apt-get install --yes \
  vim less \
  && sed -i \
      -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
      -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
      -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
      -e 's/^#\(LoadModule .*mod_proxy_fcgi.so\)/\1/' \
      -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
      -e 's/^#\(LoadModule .*mod_http2.so\)/\1/' \
      conf/httpd.conf

# Copy over SSL files
COPY ssl/ /throwaway/
RUN cp /throwaway/*.pem conf \
  && rm -rf /throwaway \
  && echo 'IncludeOptional conf/extra/000-default.conf' >> conf/httpd.conf

COPY 000-default.conf conf/extra
