#!/bin/bash

name=rspec

# shellcheck disable=SC2046,SC1083
nexus_ip=$(kubectl get pod $(kubectl get pod -l "app=sonatype-nexus" -o jsonpath="{.items[0].metadata.name}") --template={{.status.podIP}})
nexus_docker_group_port=8125
nexus_docker_port=8123
nexus_port=8081

fly -t local set-pipeline -n -p $name -c concourse.yaml --var "nexus_ip=$nexus_ip" --var "nexus_docker_group_port=$nexus_docker_group_port" --var "nexus_docker_port=$nexus_docker_port" --var "nexus_port=$nexus_port" -l ../credentials.yml
fly -t local unpause-pipeline -p $name
