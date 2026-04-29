workspace "CD" "Kubernetes Continuous Delivery powered by Kargo and ArgoCD" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		image_registry = softwareSystem "Image registry" "" "#docker, #db"
		chart_registry = softwareSystem "Chart registry" "" "#helm, #db"
		iac_repository = softwareSystem "IaC repository" "" "#github, #db"
		k8s = softwareSystem "Kubernetes" "" "#k8s"
		
		kargo = softwareSystem "Kargo" "Seamlessly orchestrate stage-to-stage deployments, without custom scripts or CI pipelines." "#web, #kargo" {
			url https://kargo.io
			
			-> image_registry "monitors"
			-> chart_registry "monitors"
			-> iac_repository "monitors"
			-> iac_repository "updates"
		}
		
		argocd = softwareSystem "ArgoCD" "Declarative continuous delivery with a fully-loaded UI." "#web, #argocd" {
			url https://argoproj.github.io/cd/
			
			-> iac_repository "monitors"
			-> image_registry "fetches images from"
			-> chart_registry "fetches charts from"
			-> k8s "reconciles"
		}
	}
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/topology/theme.json
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/heraldry2/theme.json
		
		styles {
			element "Software System Instance" {
				description true
				height 350
			}
			
			element "#kargo" {
				stroke #E59655
				# icon ./kargo.svg
			}
		}
		
		properties {
			"structurizr.sort" "created"
		}
		
		systemLandscape "C4_l" {
			include *
		}
	}
}
