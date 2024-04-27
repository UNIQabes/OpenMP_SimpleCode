bin/cs : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib c_matrix.c second.c  -o bin/cs

bin/cp : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib -Xpreprocessor -fopenmp -lomp c_matrix.c second.c  -o bin/cp

bin/ais : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib a_sum_int.c second.c  -o ais

bin/aip : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib -Xpreprocessor -fopenmp -lomp a_sum_int.c second.c  -o bin/aip

bin/afs : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib a_sum_float.c second.c  -o afs

bin/afp : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib -Xpreprocessor -fopenmp -lomp a_sum_float.c second.c  -o bin/afp

bin/bs : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib b_sum.c second.c  -o bin/bs

bin/bp : c_matrix.c second.c
	gcc -I /opt/homebrew/opt/libomp/include -L /opt/homebrew/opt/libomp/lib -Xpreprocessor -fopenmp -lomp b_sum.c second.c  -o bin/bp
