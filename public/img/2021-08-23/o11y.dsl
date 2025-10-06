workspace "OTEL Collector" "description" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		o11y = softwareSystem "Observability" "Storage and dashboard, e.g., Grafana, Datadog." "#otel" {
			loki = container "Loki" "Horizontally-scalable, highly available, multi-tenant log aggregation system." "" "#loki"
			prometheus = container "Prometheus" "From metrics to insight. Power your metrics and alerting with a leading open-source  solution." "" "#prometheus"
			tempo = container "Tempo" "Open-source, easy-to-use, and high-scale distributed tracing backend." "" "#tempo"
			
			otel = container "OpenTelemetry Collector" "Vendor-agnostic implementation on how to receive, process and export telemetry data" "" "#otel" {
				-> loki "exports logs to" "" ""
				-> tempo "exports traces to" "" ""
				-> prometheus "exports metrics to" "" ""
			}
			
			grafana = container "Grafana" "Operational dashboards for your data here, there, or anywhere." "" "#web, #grafana" {
				url https://grafana.com
				
				-> loki "ingests logs from" "" ""
				-> prometheus "ingests metrics from" "" ""
				-> tempo "ingests traces from" "" ""
			}
		}
	}
	
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/topology/theme.json
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/heraldry2/theme.json
		
		# styles {
			# 	element "#tempo" {
				# 		stroke #F46800
				# 		icon tempo.png
			# 	}
			# 	element "#loki" {
				# 		stroke #F46800
				# 		icon loki.png
			# 	}
		# }
		
		properties {
			"structurizr.sort" "created"
		}
		
		container o11y "C4_2" "" {
			include *
		}
	}
}
