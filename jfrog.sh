#!/bin/bash

cd ./jfrog
terraform init
terraform plan -out plan.out
terraform apply "plan.out"
