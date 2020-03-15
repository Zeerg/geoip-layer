define build_layer
	docker run --name geoip -d geoip-layer false
	docker cp geoip:/opt layer
	docker rm geoip
	touch layer/.slsignore
	echo "**/*.la" > layer/.slsignore
	echo "share/**" >> layer/.slsignore
	echo "include/**" >> layer/.slsignore
	echo "bin/**" >> layer/.slsignore
endef

rebuild:
ifeq ($(license),)
	@echo "Please Specify Maxmind License with license="
else
	docker build --no-cache --build-arg license=$(license) -t geoip-layer:latest .
	$(call build_layer)
endif

build:
ifeq ($(license),)
	@echo "Please Specify Maxmind License with license="
else
	docker build --build-arg license=$(license) -t geoip-layer:latest .
	$(call build_layer)
endif

clean:
	rm -rf layer

deploy:
	serverless deploy