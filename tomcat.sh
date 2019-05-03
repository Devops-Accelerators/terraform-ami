#!/bin/bash

cd ./tomcat
terraform init
terraform plan -out plan.out
terraform apply "plan.out"

