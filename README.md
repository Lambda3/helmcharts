# Lambda3 Helm Charts

These are all Lambda3's charts.

## TL;DR;

```console
$ helm repo add lambda3 https://lambda3.github.io/helmcharts/
$ helm repo update
$ helm install agent lambda3/<chart name>
```

## Introduction

**Note**: The docs are for Helm 3, if you are running Helm 2 you will have to
adapt the commands.

This repo contains [Helm](https://helm.sh) charts for [Kubernetes](http://kubernetes.io).

## Prerequisites

- Kubernetes 1.14+ (might work on earlier versions, but not tested)
- Helm 3.0+ or Helm 2 (not tested)

## Add the repo

Add the help repo:

```console
$ helm repo add lambda3 https://lambda3.github.io/helmcharts/
$ helm repo update
```

## Install the Chart

Find the chart you want by looking at the
[charts](https://github.com/Lambda3/helmcharts/tree/master/charts/)
directory. Every chart has a `README.md` file, read it for more options.

To install the chart `azure-pipelines-agent` with the release name `agent`:

```console
$ helm install agent lambda3/azure-pipelines-agent --set pipeline.tenant=<your tenant>,pipeline.pat=<your pat>
```

> **Tip**: List all releases using `helm list`.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
