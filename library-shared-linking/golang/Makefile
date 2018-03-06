all: *.go
	make shared

shared: *.go
	go build -buildmode=c-shared -o libmytest.so $^

archive: *.go
	go build -buildmode=c-archive -o libmytest.a $^
