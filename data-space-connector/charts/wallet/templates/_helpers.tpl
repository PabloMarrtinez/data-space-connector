{{/* Expand the name of the chart. */}}
{{- define "wallet.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{/* Create a default fully qualified app name. */}}
{{- define "wallet.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name -}}
{{- end -}}
{{- end -}}

{{/* Common labels */}}
{{- define "wallet.labels" -}}
app.kubernetes.io/name: {{ include "wallet.name" . }}
helm.sh/chart: {{ include "wallet.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Chart name and version */}}
{{- define "wallet.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* ServiceAccount name */}}
{{- define "wallet.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{ default (include "wallet.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{ default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end -}}
