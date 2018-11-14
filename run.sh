kubectl apply -f https://raw.githubusercontent.com/giantswarm/kubernetes-prometheus/master/manifests-all.yaml
kubectl --namespace monitoring delete job grafana-import-dashboards
kubectl apply --filename ./manifests/grafana/import-dashboards/job.yaml
export POD_NAME=$(kubectl get pods --namespace monitoring -l "app=grafana,component=core" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace monitoring $POD_NAME 3000:3000
echo 'Deploying Grafana Done';
echo 'Use http://localhost:31932 To Access Grafana OR Use http://localhost:30121 Tos Access Prometheus';
