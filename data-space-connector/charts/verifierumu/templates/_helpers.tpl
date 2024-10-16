{{/* Expand the name of the chart. */}}
{{- define "verifierumu.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{/* Create a default fully qualified app name. */}}
{{- define "verifierumu.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name -}}
{{- end -}}
{{- end -}}

{{/* Common labels */}}
{{- define "verifierumu.labels" -}}
app.kubernetes.io/name: {{ include "verifierumu.name" . }}
helm.sh/chart: {{ include "verifierumu.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Chart name and version */}}
{{- define "verifierumu.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* ServiceAccount name */}}
{{- define "verifierumu.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{ default (include "verifierumu.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{ default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end -}}
