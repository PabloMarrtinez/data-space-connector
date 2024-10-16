{{/* Expand the name of the chart. */}}
{{- define "issuer.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{/* Create a default fully qualified app name. */}}
{{- define "issuer.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name -}}
{{- end -}}
{{- end -}}

{{/* Common labels */}}
{{- define "issuer.labels" -}}
app.kubernetes.io/name: {{ include "issuer.name" . }}
helm.sh/chart: {{ include "issuer.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Chart name and version */}}
{{- define "issuer.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* ServiceAccount name */}}
{{- define "issuer.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{ default (include "issuer.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{ default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end -}}
