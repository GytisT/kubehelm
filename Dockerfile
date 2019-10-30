FROM alpine:3.10

LABEL maintainer="Gytis Tamulynas <GytisT1@gmail.com>" \
    description="Kubernetes, helm, gpg" \
    version="v1.0.0"

# https://github.com/kubernetes/kubernetes/releases
ENV KUBECTL_VERSION="v1.16.2"
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.15.1"

RUN apk add --no-cache ca-certificates bash git openssh curl gnupg \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

WORKDIR /config

CMD bash