triangletestobj = triangletest.o trianglecollisiondetection.o
testobj = test.o loadstl.o trianglecollisiondetection.o 
test: 	$(testobj)
	g++ -pg -O3 -o $(testobj)
triangletest: $(triangletestobj)
	g++ -pg -O3 -o triangletest.out $(triangletestobj)
test.o: test.cpp loadstl.h common.h
	g++ -pg -O3 -c test.cpp
triangletest.o: triangletest.cpp trianglecollisiondetection.h
	g++ -pg -O3 -c triangletest.cpp
trianglecollisiondetection.o: trianglecollisiondetection.cpp trianglecollisiondetection.h common.h
	g++ -pg -O3 -c trianglecollisiondetection.cpp
loadstl.o: loadstl.cpp loadstl.h common.h
	g++ -pg -O3 -c loadstl.cpp
.PHONY: cleanall cleantest cleantriangletest
cleantriangletest:
	-rm triangletest.out $(triangletestobj)
cleantest:
	-rm test.out $(testobj)
cleanall:
	-rm test.out triangletest.out $(triangletestobj) $(testobj)
