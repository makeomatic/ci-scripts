# CI Scripts

This repository contains helper scripts useful for usage with CI systems.

## Installation

```
# install master
curl -sSL https://github.com/makeomatic/ci-scripts/raw/master/install.sh | sh -s

# install from a ref
curl -sSL https://github.com/makeomatic/ci-scripts/raw/master/install.sh | sh -s -- -r mycommit_tag_or_branch

# help
curl -sSL https://github.com/makeomatic/ci-scripts/raw/master/install.sh | sh -s -- -h
```

## Scripts

- **docker-build**
   Builds a docker image and tags it using version tags from a label.

   ```
Usage: ./docker-build [-l version_tags] [-v variant] [-nh] image [docker-build-opts]

    Builds and tags a docker image using version tags from a container label.

    -l version_tags     - specifies label which stores version tags (default: version_tags).
    -v variant          - specifies variant which is appended to versions (aka: image:16.04-variant).
    -n                  - specifies whether not to tag the latest label.
    -h                  - prints this help.

    docker-build-options    - a list of options passed to docker build, note that there's no need
                              to pass -t.
   ```
