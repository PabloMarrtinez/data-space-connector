Generar un certificado para el servicio de ingress wallet:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/C=GR/ST=Athens/L=Athens/O=ssikit-wallet/CN=ssikit-wallet" -addext "subjectAltName=DNS:wallet.tango.io"
```

Lo guardo como secreto:

```bash
kubectl create secret tls wallet-cert --cert=tls.crt --key=tls.key
```