FROM alpine

RUN apk add --no-cache \
	openldap \
	openldap-backend-all \
	openldap-overlay-all
RUN mkdir -p /run/openldap && \
	chown -R ldap:ldap /run/openldap
ADD start-slapd /usr/sbin

ENV \
	domain="example.com" \
	rootName="Admin" \
	rootPassword="secret"

EXPOSE 368 636
VOLUME ["/etc/openldap", "/var/lib/openldap"]

ENTRYPOINT ["/usr/sbin/start-slapd", \
	"-d", "stats", \
	"-u", "ldap", \
	"-g", "ldap"]
CMD ["-h", "ldap:// ldaps://"]

# vim:ai:
