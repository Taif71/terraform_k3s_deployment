tf_init:
	@ echo "Initializing terraform..."
	@ cd "${PWD}/env/dev" && terraform fmt -recursive
	@ cd "${PWD}/env/dev" && terraform init

tf_plan:
	@ echo "Planning terraform"
	@ cd env/dev && terraform plan
	# @ terraform plan

tf_apply:
	@ echo "Applying terraform"
	@ cd env/dev && terraform apply -auto-approve
	# @ terraform apply -auto-approve

tf_deploy:
	@ echo "Destroying terraform..."
	@ cd env/dev && terraform destory -auto-approve
	# @ terraform destory -auto-approve