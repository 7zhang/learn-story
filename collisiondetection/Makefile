triangletest.out: triangletest.o trianglecollisiondetection.o
	g++ -pg -O3 -o triangletest.out triangletest.o trianglecollisiondetection.o
triangletest.o: triangletest.cpp trianglecollisiondetection.h
	g++ -pg -O3 -c triangletest.cpp
trianglecollisiondetection.o: trianglecollisiondetection.cpp trianglecollisiondetection.h
	g++ -pg -O3 -c trianglecollisiondetection.cpp
clean:
	rm triangletest.out triangletest.o trianglecollisiondetection.o
