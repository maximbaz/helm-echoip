# helm-echoip

Helm charts for [echoip](https://github.com/mpolden/echoip).

## Usage

Deploy to k8s with helm:

```
helm upgrade -i echoip . --set host=echoip.mydomain.com
```

See `values.yaml` for the default values. You can override anything with `--set`:

```
helm upgrade -i echoip . --set host=echoip.mydomain.com,useGeoDb=false
```

## Rate limiting

For example, Traefik allows configuring rate limits via Ingress annotations.

Enable rate limiting as following:

```
helm upgrade -i echoip . --set host=echoip.mydomain.com -f extra/traefik-ratelimit.yaml
```
