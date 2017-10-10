apply:
	puppet apply /etc/puppet/code/site.pp

update:
	[ -f /etc/debian_version ] && aptitude update || true
	[ -f /etc/redhat-release ] && yum check-update || true

pull:
	git pull

full: pull update apply


.PHONY: apply update pull full
