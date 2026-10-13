CHART := charts/cronjob-runner
ENVS  := dev prod

.PHONY: validate
validate:
	helm lint $(CHART)
	@for env in $(ENVS); do \
		echo "== $$env"; \
		helm lint $(CHART) -f $(CHART)/values-$$env.yaml || exit 1; \
		helm template check $(CHART) -f $(CHART)/values-$$env.yaml | kubeconform -strict -summary || exit 1; \
	done
