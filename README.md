# helm-ipd

Helm charts for [ipd](https://github.com/mpolden/ipd).

## Usage

Deploy to k8s with helm:

```
helm upgrade -i ipd . --set host=ipd.mydomain.com
```

See `values.yaml` for the default values. You can override anything with `--set`:

```
helm upgrade -i ipd . --set host=ipd.mydomain.com,useGeoDb=false
```

## Rate limiting

For example, Traefik allows configuring rate limits via Ingress annotations.

Enable rate limiting as following:

```
helm upgrade -i ipd . --set host=ipd.mydomain.com -f extra/traefik-ratelimit.yaml
```
