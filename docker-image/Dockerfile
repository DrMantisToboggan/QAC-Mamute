FROM java:8-jdk

# Mamute version
ENV VERSION=1.5.0

RUN mkdir /opt/mamute
WORKDIR /opt/mamute

#RUN wget -nv https://github.com/caelum/mamute/releases/download/v${VERSION}/mamute-${VERSION}.war
#Zip up the contents of the mamute folder and place modified war file here
RUN rm *.war
RUN rm ../mamute-1.5.0/*.war
RUN ../mamute-1.5.0/jar -cvf mamute-${VERSION}.war *
RUN mv ../mamute-1.5.0/mamute-${VERSION}.war ../docker-image/

ADD mamute-1.5.0.war /opt/mamute/
RUN \
    unzip mamute-${VERSION}.war && \
    rm mamute-${VERSION}.war

ADD startup.sh /opt/mamute/
RUN chmod +x /opt/mamute/*.sh

# Defaults:
ENV VRAPTOR_ENV=production \
    \
    MAMUTE_HOST=localhost \
    MAMUTE_PORT=80 \
    MAMUTE_ENABLE_SIGNUP=true \
    MAMUTE_ALLOW_QUESTION_DELETE=true \
    MAMUTE_ENABLE_SOLR=true \
    MAMUTE_ATTACHMENTS_PATH=/tmp \
    \
    DB_HOST=mysql \
    DB_PORT=3306 \
    DB_USER=mamute \
    DB_PWD=mamute \
    DB_NAME=mamute \
    \
    MAIL_SERVER=smtp.sample.server \
    MAIL_PORT=25 \
    MAIL_USE_TLS=false \
    MAIL_USERNAME=user \
    MAIL_PASSWORD=password \
    MAIL_FROM=no-reply@null.com \
    MAIL_FROM_NAME="Mamute System" \
    \
    LDAP_PORT=389 \
    LDAP_USER=user \
    LDAP_PASS=pass \
    LDAP_USERDN="OU=Users,DC=company,DC=com" \
    LDAP_GROUP_ATTR=memberOf \
    LDAP_MODERATOR_GROUP="CN=Moderators,OU=Groups,DC=company,DC=com" \
    LDAP_USE_SSL=false

EXPOSE 80
ENTRYPOINT ["/opt/mamute/startup.sh"]
