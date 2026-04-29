workspace "GitOps" "Kubernetes Continuous Delivery powered by GitOps Promoter and ArgoCD" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		image_registry = softwareSystem "Image registry" "" "#docker, #db"
		chart_registry = softwareSystem "Chart registry" "" "#helm, #db"
		iac_repository = softwareSystem "IaC repository" "" "#github, #db"
		k8s = softwareSystem "Kubernetes" "" "#k8s"
		
		promoter = softwareSystem "GitOps Promoter" "orchestrates stage-to-stage deployments" "#web, #gitops-promoter" {
			url https://gitops-promoter.readthedocs.io/en/latest/
			
			-> iac_repository "oversees"
		}
		
		argocd = softwareSystem "ArgoCD" "Reconciles repository and cluster" "#web, #argocd" {
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
			element "#gitops-promoter" {
				stroke #EF7B4D
				icon gitops-promoter.svg
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
