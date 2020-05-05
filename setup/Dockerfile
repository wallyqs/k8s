FROM synadia/nats-box:0.3.0

ENV KUBECTL_VERSION 1.16.2
ENV DEFAULT_NSC_DIR /nsc

COPY nats-setup.sh /usr/local/bin/nats-setup.sh
COPY nsc-setup.sh /usr/local/bin/nsc-setup.sh
COPY basic.dhall /tmp/basic.dhall

RUN set -eux; \
	wget -O /kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl; \
	chmod +x /kubectl && mv /kubectl /usr/local/bin/kubectl

# Install Dhall and warm the cache
RUN set -eux; \
	wget https://github.com/dhall-lang/dhall-haskell/releases/download/1.31.1/dhall-yaml-1.0.3-x86_64-linux.tar.bz2; \
	tar xjf dhall-yaml-1.0.3-x86_64-linux.tar.bz2; \
	cp ./bin/dhall-to-yaml-ng /usr/local/bin/dhall-to-yaml; \
	dhall-to-yaml --file /tmp/basic.dhall

ENTRYPOINT []
CMD ["/bin/sleep", "300"]
