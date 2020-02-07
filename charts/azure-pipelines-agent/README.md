# Azure Pipelines Agent Chart

The in Kubernetes Azure Pipelines Agent.

## TL;DR;

```console
$ helm repo add lambda3 https://lambda3.github.io/helmcharts/
$ helm repo update
$ helm install agent lambda3/azure-pipelines-agent --set pipeline.tenant=<your tenant>,pipeline.pat=<your pat>
```

## Introduction

**Note**: The docs are for Helm 3, if you are running Helm 2 you will have to
adapt the commands.

This chart bootstraps a Azure Pipelines Agent deployment on a [Kubernetes](http://kubernetes.io)
cluster using the [Helm](https://helm.sh) package manager.

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

To install the chart with the release name `agent`:

```console
$ helm install agent lambda3/azure-pipelines-agent --set pipeline.tenant=<your tenant>,pipeline.pat=<your pat>
```

The command deploys an Azure Pipelines Agent on the Kubernetes cluster in the
default configuration. The [Parameters](#parameters) section lists the
parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`.

## Uninstalling the Chart

To uninstall/delete the `agent` deployment:

```console
$ helm uninstall agent
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the Kubernetes Azure
Pipelines Agent chart and their default values. For more information on agent
specific values please see
[the image project repository](https://lambda3.github.io/docker-azure-pipelines-agent/).

|            Parameter                      |                                  Description                                  |                           Default                            |
| ----------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `pipeline.pat` | The agent personal access token (PAT). | `nil` (required) |
| `pipeline.tenant` | The Azure DevOps Tenant. | `nil` (required) |
| `pipeline.pool` | The Azure Pipelines agent pool. | `Default` (required) |
| `replicaCount` | The number of agents to run | `1` (required) |
| `image.repository` | Image name | `lambda3/azure-pipelines-agent` |
| `image.tag` | Image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `Always` |
| `imagePullSecrets` | Global Docker registry secret names as an array | `[]` (does not add image pull secrets to deployed pods)      |
| `serviceAccount.create` | Should create a service account | `true` |
| `serviceAccount.name` | Should create a service account | Release full name |
| `resources` | Resource for the pods (limits, requests etc.) | `{}` |
| `podSecurityContext` | Pod security context | `{}` |
| `securityContext` | Security context | `{}` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | List of node taints to tolerate | `[]` |
| `affinity` | Map of node/pod affinities | `{}`                                                         |
| `nameOverride` | String to partially override azure-pipelines-agent.fullname template with a string (will prepend the release name) | `nil`                               |
| `fullnameOverride` | String to fully override azure-pipelines-agent.fullname template with a string | `nil` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install agent lambda3/azure-pipelines-agent \
    --set pipeline.tenant=<your tenant>,pipeline.pat=<your pat>
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install agent lambda3/azure-pipelines-agent -f values.yaml
```

> **Tip**: You can use the default [values.yaml](https://github.com/Lambda3/docker-azure-pipelines-agent-chart/blob/master/azure-pipelines-agent/values.yaml) as a starter for
> your parameters.
