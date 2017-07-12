#!/usr/bin/env bash
gcloud config set compute/zone us-east1-b

gcloud container clusters create distributed-1 --num-nodes 6 -m n1-standard-4 --no-async \
	--disk-size=50 --tags=distributed,anacondascale # --enable-autoscaling --min-nodes=6 --max-nodes=16

gcloud container clusters get-credentials distributed-1

kubectl create -f kubernetes

# gcloud container clusters resize distributed-1 --size=5 --async
# gcloud container clusters list

# gcloud container clusters delete distributed-1
