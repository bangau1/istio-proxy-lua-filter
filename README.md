To learn about this sandbox and for instructions on how to run it please head over
to the [Envoy docs](https://www.envoyproxy.io/docs/envoy/latest/start/sandboxes/lua.html).

# Development

## To run it locally
- make run-local
- curl https://localhost:8000

## To run it with Istio
- `kubectl create namespace agung`
- `kubectl label namespace agung istio-injection=enabled`
- `make deploy-istio NAMESPACE=agung`
- curl http://<pod-ip>/ 
