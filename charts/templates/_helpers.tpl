{{- define "redis_pvc_name" }}
{{- printf "%s-%s-pvc" .Release.Name .Values.cache.name | quote -}}
{{- end }}

{{- define "redis_name" }}
{{- printf "%s-%s" .Release.Name .Values.cache.name | quote -}}
{{- end }}

{{- define "selector_redis_labels" -}}
app.kubernetes.io/brand: {{ .Values.desc.brand }}
app.kubernetes.io/part-of: {{ .Values.desc.partOf }}
app.kubernetes.io/env: {{ .Values.desc.env }}
app.kubernetes.io/release: {{ .Release.Name }}
app.kubernetes.io/component: cache
app.kubernetes.io/name: {{ printf "%s-%s" .Values.desc.partOf .Values.cache.name }}
{{- end -}}

{{- define "redis_labels" -}}
{{ include "selector_redis_labels" . }}
app.kubernetes.io/project: {{ .Values.desc.project }}
{{- end -}}
