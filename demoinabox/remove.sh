# Remove the demos
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/demoinabox-frontend.yaml
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/redis.yaml
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/mysql.yaml
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/demoinabox-backend.yaml

# Stop demoinabox frontend
sudo systemctl stop demoinabox.service

# Remove otel collector
helmlist=$(helm list)
re=".*(splunk-otel-collector-[0-9]{3,}).*"
if [[ $helmlist =~ $re ]]; then
  $(helm uninstall ${BASH_REMATCH[1]});
fi