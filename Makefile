SHELL=/bin/bash

ansible_args ?=
localvars ?= localvars.yaml

ANSIBLE_CMD=ANSIBLE_FORCE_COLOR=true ansible-playbook $(ansible_args) -e @$(localvars)

usage:
	@echo 'Usage:'
	@echo 
	@echo 'To deploy the environment:'
	@echo 'make deploy'
	@echo
	@echo 'To undeploy the environment:'
	@echo 'make undeploy'

deploy: $(localvars)
	touch $(localvars)
	$(ANSIBLE_CMD) tearup.yaml

undeploy: $(localvars)
	$(ANSIBLE_CMD) teardown.yaml
