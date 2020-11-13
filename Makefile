run-local:
	docker-compose build && docker-compose up

NAMESPACE=agung
deploy-istio:
	# put all lua libs being used into configmap
	kubectl create cm -n $(NAMESPACE) lua-libs --from-file=./lib/ | echo "Already exists"

	# customize the 

	helm upgrade --install lua-filter-stable icarus/app \
		--values istio/helm-values.yaml --set nameOverride=lua-filter \
		--namespace $(NAMESPACE)
