#!/bin/bash
sudo systemctl enable docker
sudo systemctl start docker
oc new-project ${GUID}-gogs --display-name="Gogs"
oc apply -f ./deploy/service_account.yaml
oc apply -f ./deploy/role.yaml
oc apply -f ./deploy/role_binding.yaml
oc apply -f ./deploy/operator.yaml
oc get pod -w
oc logs -f gogs-operator-5d889c6c44-5bj7j
oc apply -f gogs.yaml
oc apply -f gogs.yaml
