#!/bin/bash

cd ./locust
terraform init
terraform plan -out plan.out
terraform apply "plan.out"

