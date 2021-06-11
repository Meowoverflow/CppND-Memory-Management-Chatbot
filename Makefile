.PHONY: all
all: format chk-leak build

.PHONY: format
format:
	clang-format src/* include/* -i

.PHONY: build
build:
	mkdir -p build
	cd build && \
	cmake .. && \
	make

.PHONY: debug
debug:
	mkdir -p build
	cd build && \
	cmake -DCMAKE_BUILD_TYPE=debug .. && \
	make

.PHONY: clean
clean:
	rm -rf build

.PHONY: chk-leak
chk-leak:
	cd build &&\
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=./valgrind-out.txt ./membot
