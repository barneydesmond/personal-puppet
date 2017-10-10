all: aptitude-update apply

aptitude-update:
	aptitude update

apply:
	puppet apply /etc/puppet/code/site.pp

.PHONY: apply aptitude-update
