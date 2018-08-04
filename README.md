# helm-ipd

Helm charts for [ipd](https://github.com/mpolden/ipd).

## Usage

Deploy to k8s with helm:

```
helm upgrade -i ipd . --set ingressType=traefik,host=ipd.example.com
```

## Rate limiting

For example, Traefik allows configuring rate limits via Ingress annotations.

Enable rate limiting as following:

```
helm upgrade -i ipd . --set ingressType=traefik,host=ipd.example.com -f extra/traefik-ratelimit.yaml
```
