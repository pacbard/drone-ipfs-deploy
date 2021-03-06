# Drone ipfs-deploy

[![Build Status](https://img.shields.io/drone/build/pacbard/drone-ipfs-deploy?logo=drone&server=https%3A%2F%2Fdrone.ebardelli.com)](https://drone.ebardelli.com/pacbard/drone-ipfs-deploy/)
[![ipfs-deploy Upstream Version](https://img.shields.io/github/v/tag/pacbard/drone-ipfs-deploy?label=ipfs-deploy%20version&logo=github)](https://github.com/pacbard/drone-ipfs-deploy/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/pacbard/drone-ipfs-deploy?logo=docker)](https://hub.docker.com/repository/docker/pacbard/drone-ipfs-deploy)

A drone plugin to publish a folder on the ipfs network using [ipfs-deploy](https://github.com/ipfs-shipyard/ipfs-deploy).

# Usage

There are two ways to deploy.

## From docker

Deploy the working directory to an IPFS pinning service.

See `ipfs-deploy` [usage page](https://github.com/ipfs-shipyard/ipfs-deploy/blob/master/md/usage.md) to learn more about 
which pinning or dns services are available and which environment variables to set for each.

```bash
docker run --rm \
  -e PLUGIN_PATH=folder/ \
  -e PLUGIN_PINNER=service_name \
  -e PLUGIN_DNS=dns_name \
  -e IPFS_DEPLOY_XXX__XXX=option \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  pacbard/drone-ipfs-deploy
```

## From Drone CI

```yaml
pipeline:
  pin:
    name: pin to ipfs service
    image: pacbard/drone-ipfs-deploy
    settings:
      path: folder
      pinner: service_name
      dns: dns_service_name
    environment:
      - IPFS_DEPLOY_XXX__XXX: ipfs options
```

# Parameter Reference

path
: Path to be uploaded to IPFS. If not set, `ipfs-deploy` will try to search for common output directories in the working directory.

pinner
: Name of the pinning service to use. Choices are `dappnode`, `fission`, `infura`, `ipfs-cluster`, and `pinata`. Note that some pinning services require certain environment variable to be set. See [usage](https://github.com/ipfs-shipyard/ipfs-deploy/blob/master/md/usage.md) page for more information.

dns
: Name of the dns service to use.

options
: Additional cli options to pass to `ipfs-deploy`.

# License - MIT

Copyright 2021 pacbard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
