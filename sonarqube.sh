#!/bin/bash

cd ./sonarqube
terraform init
terraform plan -out plan.out
terraform apply "plan.out"

