FROM alpine

RUN apk add --no-cache \
	openldap \
	openldap-backend-all \
	openldap-overlay-all
RUN mkdir -p /run/openldap && \
	chown -R ldap:ldap /run/openldap

EXPOSE 368 636
VOLUME ["/etc/openldap", "/var/lib/openldap"]

ENTRYPOINT ["/usr/sbin/slapd", \
	"-d", "1", \
	"-u", "ldap", \
	"-g", "ldap"]
CMD ["-h", "ldap:// ldaps://"]

# vim:ai:
