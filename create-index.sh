#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CHARTS_DIR=$DIR/charts
if ! [ -v CR_TOKEN ]; then
  echo You have to specify the token on the CR_TOKEN environment variable.
  exit 1
fi
DEPLOY_DIR=$CHARTS_DIR/.deploy
rm -rf $DEPLOY_DIR
for CHART_DIR in `ls -d $CHARTS_DIR/*/`; do
  CHART_NAME=`basename $CHART_DIR`
  echo Creating chart $CHART_NAME
  helm package $CHART_DIR --destination=$DEPLOY_DIR
  cr upload -o lambda3 -r helmcharts -p $DEPLOY_DIR
  cr index -i index.yaml -p $DEPLOY_DIR -o lambda3 -r helmcharts -c https://github.com/lambda3/helmcharts/
done
