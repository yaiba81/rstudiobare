FROM 172.30.1.1:5000/myproject/rstudio:latest

# Setup various variables
ENV TZ="Europe/Helsinki" \
    HOME="/mnt/${NAME}-pvc" \
    TINI_VERSION=v0.18.0 \
    APP_UID=999 \
    APP_GID=999 \
    PKG_R_VERSION=3.4.4 \
    PKG_RSTUDIO_VERSION=1.1.447 \
    PKG_SHINY_VERSION=1.5.7.907

#OpenShift additions
RUN if [ "$USERNAME" != "rstudio" ] ; then useradd -m $USERNAME ; fi


USER $APP_UID:$APP_GID
WORKDIR $HOME
EXPOSE 8787 3838
#MAINTAINER
ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/usr/local/bin/start.sh"]
