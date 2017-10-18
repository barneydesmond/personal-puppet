.PHONY: usage
.SUFFIXES: _key _csr _crt _pem
.PRECIOUS: %_key %_csr %_crt %_pem

# How many days should a certificate should be valid for
# This is only for local certs, eg. VPN, self-signed for shared/dedicated
DAYS=730

# How many days should a certificate signed by our CA be valid for
DAYS_CA=7000

usage:
	@echo "This makefile allows you to create:"
	@echo "  o the apache SSL passphrase tool"
	@echo "  o public/private key pairs"
	@echo "  o SSL certificate signing requests (CSRs)"
	@echo "  o self-signed SSL test certificates"
	@echo
	@echo "To create the 'pp' SSL passphrase tool, run \"make pp\"."
	@echo "To create a key pair, run \"make SOMETHING_key\"."
	@echo "To create a CSR, run \"make SOMETHING_csr\"."
	@echo "To create a test certificate, run \"make SOMETHING_crt\"."
	@echo "To create a key and a test certificate in one file, run \"make SOMETHING_pem\"."
	@echo
	@echo Examples:
	@echo "  make domain.name_key"
	@echo "  make domain.name_csr"
	@echo "  make domain.name_crt"
	@echo "  make DAYS=666 domain.name_crt"
	@echo "  make domain.name_pem"

# Generate a "pem" certificate ie an RSA key and X.509 certificate
# concatenated together.
%_pem: %_crt
	@umask 77 ; \
	cat $(^:_crt=_key) > $@ ; \
	echo ""    >> $@ ; \
	cat $^     >> $@
	if test -r CA ; \
	then \
		echo ""    >> $@ ; \
		cat CA     >> $@ ; \
	fi

# Generate an RSA private key.
#
#   man rsa
#
# for more details.
%_key:
	@umask 77 ; /usr/bin/openssl genrsa 2048 > $@

# Generate a PKCS#10 Certificate Signing Request (CSR)
#
#   man req
#
# for more details.
%_csr: %_key
	@umask 77 ; /usr/bin/openssl req -new -key $^ -out $@ </dev/tty

# Generate an X509 self-signed certificate.
#
#   man x509
#
# for more details.
%_crt: %_csr
	@umask 77 ; \
	/usr/bin/openssl x509 -req -in $^ -signkey `echo $^ | sed -e s/csr$$/key/` -days $(DAYS) -out $@; \
