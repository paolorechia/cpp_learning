
format:
	clang-format --style=Microsoft hello_world.cpp > tmp; cat tmp > hello_world.cpp; rm tmp

lint:
	cppcheck hello_world.cpp

build: format lint
	g++ hello_world.cpp -o out -g -O0


build-test:
	g++ -I /usr/local/lib/boost_1_81_0/ test_hello_world.cpp -o test

test: build-test
	./test

check-leak: build
	valgrind --leak-check=yes ./out

clean:
	(rm out || rm test) && (rm test || rm out)