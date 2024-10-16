Lo que tengo que añadir en el **coredns**:


```
          155.54.99.37 ips-as.tango.io
          155.54.99.37 ips-kc-test.tango.io
          155.54.99.37 ips-kong.tango.io
          155.54.99.37 til-ips.tango.io
          155.54.99.37 tir-ips.tango.io
          155.54.99.37 ips-verifier.tango.io
          155.54.99.37 ips.tango.io
          155.54.99.37 ips.tango.io
          155.54.99.37 tir.tango.io
          155.54.99.37 ar-ips.tango.io
          155.54.99.37 wallet.tango.io
          155.54.99.37 issuer.tango.io
          155.54.99.37 verifier.tango.io
          155.54.99.37 portal.tango.io

```

Creación de secretos:


```bash
kubectl create secret tls issuer-cert \
  --cert=issuer/issuer.crt \
  --key=issuer/issuer.key \
  -n ips

kubectl create secret tls wallet-cert \
  --cert=webWallet/webWallet.crt \
  --key=webWallet/webWallet.key \
  -n ips

kubectl create secret tls verifier-cert \
  --cert=verifier/verifier.crt \
  --key=verifier/verifier.key \
  -n ips
```


El values tango es muy importante. Versión estable del wallet - **5.0.4**