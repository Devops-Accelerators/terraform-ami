#!/bin/bash

cd ./selenium
terraform init
terraform plan -out plan.out
terraform apply "plan.out"

