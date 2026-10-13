{{- define "cronjob-runner.name" -}}
{{- .Release.Name | trunc 52 | trimSuffix "-" -}}
{{- end -}}

{{- define "cronjob-runner.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/component: job
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}
