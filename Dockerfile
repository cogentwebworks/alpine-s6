# BUILD FROM SCRATCH
FROM scratch

# BUILD ARGs
ARG TARGETPLATFORM
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

# Labels
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.description="Alpine Linux ${VERSION} with S6-Overlay" \
      org.label-schema.name="cogentwebworks/alpine" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.usage="https://github.com/cogentwebworks/alpine-s6" \
      org.label-schema.vcs-url="https://github.com/cogentwebworks/alpine-s6" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.vendor="cogentwebworks" \
      org.label-schema.version=${VERSION}

# ADD ALPINE ROOTFS
ADD ${TARGETPLATFORM}/rootfs.tar.gz /

# ADD S6-OVERLAY
ADD ${TARGETPLATFORM}/s6-overlay.tar.gz /

# INIT S6-OVERLAY
ENTRYPOINT ["/init"]

# SET DEFAULT COMMAND
CMD ["/bin/sh"]
