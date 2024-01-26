{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "atmos-namespace.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "atmos-namespace.labels" -}}
helm.sh/chart: {{ include "atmos-namespace.chart" . }}
{{ include "atmos-namespace.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "atmos-namespace.selectorLabels" -}}
gwcp.guidewire.com/app-name: {{ .Chart.Name }}
gwcp.guidewire.com/version: {{ .Chart.Version | quote }}
gwcp.guidewire.com/dept: {{ required "Department must be defined." .Values.departmentCode | quote }}
gwcp.guidewire.com/maintained-by: {{ required "Maintained by must be defined." .Values.maintainedBy | quote }}
gwcp.guidewire.com/created-by: {{ required "Created by must be defined." .Values.createdBy | quote }}
gwcp.guidewire.com/tenant-name: {{ required "Tenant name must be defined." .Values.tenantName | quote }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels }}
{{- end }}
{{- end }}
