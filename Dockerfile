FROM almalinux:8

RUN yum install yum-utils wget procps jq-1.6 -y && yum update expat libxml2 gnupg2 libgcrypt openssl-libs pcre2 curl libcurl-minimal systemd platform-python python3-libs gnutls libksba sqlite-libs zlib libcom_err krb5-libs dbus libtasn1 libarchive unbound-libs tar platform-python-setuptools python3-setuptools-wheel sqlite-libs systemd systemd-libs systemd-pam -y
RUN yum-config-manager --add-repo https://release.memsql.com/production/rpm/x86_64/repodata/memsql.repo && dnf --enablerepo=* clean all && dnf update -y

RUN yum install -y \
    singlestoredb-studio \
    && yum clean all

VOLUME ["/var/lib/memsql"]

EXPOSE 8080/tcp
USER memsql
WORKDIR "/home/memsql"

CMD ["memsql-studio"]