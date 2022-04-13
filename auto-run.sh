#!/bin/bash
while read p; do
        echo "$p"
                #az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
        dateech=$(date)
        echo "Start auto-run-custome.sh::: $dateech"
                sh auto-run-custome.sh
        dateech=$(date)
        echo "Next Line Group::: $dateech"
        unset dateech
done <GroupResource.txt

dateech=$(date)
echo "New Round::: $dateech" > run.log

