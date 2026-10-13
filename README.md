# devops-helm-cronjob-runner

A small Helm chart for running one scheduled job as a Kubernetes `CronJob`,
with the hardening you usually forget on the first pass: non-root user,
read-only root filesystem, dropped capabilities, resource limits, a
deadline, and bounded history.

## Usage

```bash
helm lint charts/cronjob-runner
helm template nightly charts/cronjob-runner -f charts/cronjob-runner/values-dev.yaml
helm install nightly charts/cronjob-runner -f charts/cronjob-runner/values-prod.yaml
```

Per-environment overrides live in `values-dev.yaml` and `values-prod.yaml`
rather than long `--set` chains.

## Validation

`make validate` lints the chart, renders it for each environment and
checks the output with `kubeconform`.
