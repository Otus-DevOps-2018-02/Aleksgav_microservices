include docker/.env

.PHONY: build_project_images build_monitoring push_all

default: build_all push_all

build_all: build_project_images build_monitoring_images

build_project_images:
	for image in ui comment post-py; \
	do cd src/$$image; \
	bash docker_build.sh; \
	cd -; \
	done

build_monitoring_images:
	for mon in alertmanager blackbox_exporter grafana mongo_db_exporter prometheus telegraf grafana; \
	do cd monitoring/$$mon; \
	docker build -t $$USER_NAME/$$mon . ; \
	cd -; \
	done

push_all:
	for image in ui comment post-py alertmanager blackbox_exporter grafana mongo_db_exporter prometheus telegraf grafana; \
	do docker push $$USER_NAME/$$image; \
	done
