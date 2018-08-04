# helm-ipd

Helm charts for [ipd](https://github.com/mpolden/ipd).

## Usage

Deploy to k8s with helm:

```
helm upgrade -i ipd . --set ingressType=traefik,host=ipd.example.com
```
