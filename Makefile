apply:
	puppet apply /etc/puppet/code/site.pp

update:
	aptitude update


.PHONY: apply aptitude-update
