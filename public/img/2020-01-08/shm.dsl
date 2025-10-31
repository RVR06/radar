workspace "SHared Memory" "Blazing fast data exchanges." {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		shm = softwareSystem "SHared-Memory" "Memory that may be simultaneously accessed by multiple programs with an intent to provide communication among them or avoid redundant copies." "#bus, #external, #shm"
		aspire = softwareSystem ".NET Aspire" "Opinionated, cloud ready stack for building observable, production ready, distributed applications." "#external, #aspire, #web" {
			dashboard = container "Dashboard" "description" "Blazor" "#web"
		}
		
		greeter = softwareSystem "Greeter" "Showcases data exchanges between actors leveraging SHM." "#dotnet" {
			producer = container "Producer" "Produces data. Stores data in SHM. Notifies data UID." "C#" "#dotnet" {
				service = component "Service" "Produces data" "C#" ""
				store = component "Store" "Stores data" "C#" ""  {
					-> shm "stores into" "{ Data }" ""
				}
				
				service -> store "persists" "{ Data }" ""
				store -> service "notifies" "{ DataId }" ""
				
				-> shm "stores into" "{ Data }" ""
				-> aspire "exports telemetry" "gRPC | OTEL" "#otel"
				-> aspire.dashboard "exports telemetry" "gRPC | OTEL" "#otel"
			}
			
			consumer = container "Consumer" "Asks for data production. Consumes data from its data UID through SHM" "C# | Worker" "#desktop, #dotnet" {
				-> producer "queries" "gRPC" ""
				-> shm "fetches from" "{ DataId }" ""
				
				-> aspire "exports telemetry" "gRPC | OTEL" "#otel"
				-> aspire.dashboard "exports telemetry" "gRPC | OTEL" "#otel"
			}
			
			-> shm "stores into & fetches from" "" ""
			-> aspire "exports telemetry" "gRPC | OTEL" "#otel"
			
		}
		
		local_ = deploymentEnvironment "local" {
			deploymentNode "Laptop" "" "Windows11" "#windows" 1 {
				aspire_ = deploymentNode "Orchestration" "" ".NET Aspire" "#aspire" 1 {
					dashboard_ = containerInstance aspire.dashboard "" ""
					producer_ = containerInstance greeter.producer "" ""
					consumer_ = containerInstance greeter.consumer "" ""
				}
				
				shm_ = softwareSystemInstance shm "" "#external"
			}
		}
		
		compose_ = deploymentEnvironment "compose" {
			deploymentNode "Laptop" "" "Windows11" "#windows" 1 {
				deploymentNode "Orchestration" "" "Docker Compose" "#docker" 1 {
					deploymentNode "dotnet/aspnet:8.0" "" "Docker" "#docker" 1 {
						producer_ = containerInstance greeter.producer "" ""
					}
					deploymentNode "dotnet/runtime:8.0" "" "Docker" "#docker" 1 {
						consumer_ = containerInstance greeter.consumer "" ""
					}
					deploymentNode "aspire" "" "Docker" "#docker" 1 {
						dashboard_ = containerInstance aspire.dashboard "" ""
					}
					
					shm_ = softwareSystemInstance shm "" "#external"
				}
			}
		}
	}
	views {
		theme https://raw.githubusercontent.com/RVR06/cornifer-contrib/main/themes/topology/theme.json
		theme https://raw.githubusercontent.com/RVR06/cornifer-contrib/main/themes/heraldry2/theme.json
		
		styles {
			element "#bus" {
				width 900
			}
			element "#shm" {
				stroke #FF006E
			}
			
			relationship "#otel" {
				colour #F5A800
				style dotted
			}
		}
		
		properties {
			"structurizr.sort" "created"
		}
		
		systemLandscape "C4_L" {
			include *
			autoLayout lr
		}
		
		systemContext greeter "C4_1" {
			include *
			autoLayout lr
		}
		
		container greeter "C4_2" {
			include *
		}
		
		component greeter.producer "C4_4_producer" {
			include *
		}
		
		deployment * local_ "C4_D_local" {
			include *
		}
		
		deployment * compose_ "C4_D_compose" {
			include *
		}
		
		dynamic greeter "C4_W_greeter" {
			greeter.consumer -> greeter.producer
			greeter.producer -> shm
			greeter.consumer -> shm
		}
		
		dynamic greeter.producer "C4_W_producer" {
			greeter.producer.service -> greeter.producer.store
			greeter.producer.store -> shm
			greeter.producer.store -> greeter.producer.service
			
		}
	}
}