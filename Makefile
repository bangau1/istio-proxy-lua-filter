run-local:
	docker-compose build && docker-compose up

NAMESPACE=agung
deploy-istio:
	# put all lua libs being used into configmap
	kubectl create cm -n $(NAMESPACE)  lua-libs --from-file=./lib/ --dry-run=client -o yaml > istio/configmap-lua-lib.yaml
	kubectl apply -f istio/configmap-lua-lib.yaml

	# customize the envoy filter
	kubectl apply -f istio/envoy-filter.yaml -n $(NAMESPACE)

	helm upgrade --install lua-filter-stable icarus/app \
		--values istio/helm-values.yaml --set nameOverride=lua-filter \
		--namespace $(NAMESPACE) --wait --timeout=30s
