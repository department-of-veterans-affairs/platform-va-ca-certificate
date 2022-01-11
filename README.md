VA CA Certificate backup repository

Mirrors the CA signing certificates available at http://aia.pki.va.gov/PKI/AIA/VA/

Reasoning: Occasionally the site willbe unreachable or return 404's on the certificates, so we wanted a local backup.

This repository has a workflow which periodically updates the certificates with the ones available from the official site.

Also included are examples of scripts which will install the certificates on various flavors of Linux.

al2: Amazon Linux 2
alpine: Alpine Linux
ubuntu-minimal: Ubuntu Minimal

To use these scripts, you would check out this repo, copy the certificates from this repository into /tmp (or wherever you like and then modify the paths in the script) and run the script.

Once this repository is made public, we can use curl or wget to retrieve the certificates from the Github raw repo instead of checking the repo out.
