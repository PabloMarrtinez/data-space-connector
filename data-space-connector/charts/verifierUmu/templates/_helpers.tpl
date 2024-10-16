{{/* Expand the name of the chart. */}}
{{- define "verifierUmu.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{/* Create a default fully qualified app name. */}}
{{- define "verifierUmu.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name -}}
{{- end -}}
{{- end -}}

{{/* Common labels */}}
{{- define "verifierUmu.labels" -}}
app.kubernetes.io/name: {{ include "verifierUmu.name" . }}
helm.sh/chart: {{ include "verifierUmu.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Chart name and version */}}
{{- define "verifierUmu.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* ServiceAccount name */}}
{{- define "verifierUmu.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{ default (include "verifierUmu.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{ default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end -}}
