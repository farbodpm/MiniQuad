build:
	docker run -i --rm -v ${PWD}/docker_cache/cargo_registry:/root/.cargo/registry -v ${PWD}:/project vahid4134/esp-rust-build:latest   bash -c "export ESP_IDF_COMPONENTS='pthread;esp_eth;esp_littlefs' &&  export ESP_IDF_TOOLS_INSTALL_DIR=global && cd /project && source ~/export-esp.sh && cd test/scripts && ./build.sh"
	#esp_eth_enc28j60
new-componenet: 
	docker run -i --rm -v ${PWD}/docker_cache/cargo_registry:/root/.cargo/registry -v ${PWD}:/project vahid4134/esp-rust-build:latest   bash -c "idf.py -C example_project/components create-component example_component"