apply:
	puppet apply /etc/puppet/code/site.pp

update:
	aptitude update

pull:
	git pull


.PHONY: apply aptitude-update
