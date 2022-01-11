#!/usr/bin/env bash
set -euo pipefail

#
# Install the following VA certs. Place them in a location that is easily
# shared and in the system trust.
# Other tools, like install Java, can simply just look for any
# files in $ADDITIONAL_CA_CERTS to install.
#

CA_CERTS=(
  /tmp/VA-Internal-S2-RCA1-v1.cer
  /tmp/VA-Internal-S2-ICA4.cer
  /tmp/VA-Internal-S2-ICA5.cer
  /tmp/VA-Internal-S2-ICA6.cer
  /tmp/VA-Internal-S2-ICA7.cer
  /tmp/VA-Internal-S2-ICA8.cer
  /tmp/VA-Internal-S2-ICA9.cer
  /tmp/VA-Internal-S2-ICA10.cer
  /tmp/VA-Internal-S2-ICA1-v1.cer
  /tmp/VA-Internal-S2-ICA2-v1.cer
  /tmp/VA-Internal-S2-ICA3-v1.cer
)

ANCHORS=/usr/local/share/ca-certificates/
for CERT in ${CA_CERTS[@]}
do
  echo "Copying $CERT"
  OUT=$ANCHORS/${CERT##*/}
  cp $CERT $OUT
done
for cert in $(find $ANCHORS -type f -name "*.cer")
  do
    echo "Installing $cert"
    out_name="${cert%.*}"
    openssl x509 -inform der -in $cert -out $out_name.crt
    chmod 0444 $out_name.crt
  done

echo "Installed CA certs"

update-ca-certificates
