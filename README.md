# Deploy toolkit

## Description

This toolkit contains below components without setup

- Google Cloud SDK
- kubectl
- kubernetes-helm
- stern

## Requirements

- direnv
- docker (tested on linux/mac)

## Setup

What you need is only type it on Project-Root!

```
$ curl https://bit.ly/2TS2J3r |sh
```

Original URL is `https://raw.githubusercontent.com/takutakahashi/deploy-tools/master/init_project.sh`

## Options

If you set `$ADDITIONAL_OPTS`, you can attach volume, set environment to component docker container.

## License

See LICENSE.txt
