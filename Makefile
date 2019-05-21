.PHONY: help
.DEFAULT_GOAL := help

protoc: ## generate proto code
	protoc -I=proto --go_out=plugins=grpc,paths=source_relative:./proto proto/activity/activity.proto
	protoc -I=proto --go_out=plugins=grpc,paths=source_relative:./proto proto/task/task.proto
	protoc -I=proto --go_out=plugins=grpc,paths=source_relative:./proto proto/user/user.proto
	protoc -I=proto --go_out=plugins=grpc,paths=source_relative:./proto proto/project/project.proto

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
