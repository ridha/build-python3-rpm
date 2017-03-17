TARGET:=python-3.6.0
OUTPUT:=$(TARGET)-1.el7.x86_64.rpm
centos7: $(OUTPUT)

$(OUTPUT): Dockerfile-centos7
	docker build --rm -t python:3.6.0-centos -f Dockerfile-centos7 .
	ID=$$(docker create python:3.6.0-centos) \
	&& docker cp $$ID:/build/$(TARGET)-1.x86_64.rpm $(OUTPUT) \
	&& docker rm $$ID
