#!/bin/zsh

hostname

array=( 1 2 4 8 16 32 64 128)

echo "\"ThreadN\",\"ai\",\"af\",\"b\",\"c\""

for i in $array
do
	ai_sum=0
	af_sum=0
	b_sum=0
	c_sum=0

	export OMP_NUM_THREADS=$i
	iterC=10
	for v in $(seq $iterC)
	do
		ai_time=$(bin/aip)
		af_time=$(bin/afp)
		b_time=$(bin/bp)
		c_time=$(bin/cp)

		ai_sum=$((ai_time+ai_sum))
		af_sum=$((af_time+af_sum))
		b_sum=$((b_time+b_sum))
		c_sum=$((c_time+c_sum))
	done

	ai_sum=$((ai_sum/iterC))
	af_sum=$((af_sum/iterC))
	b_sum=$((b_sum/iterC))
	c_sum=$((c_sum/iterC))

	echo "\"${i}\",\"${ai_sum}\",$i\"${af_sum}\",$i\"${b_sum}\",$i\"${c_sum}\""
done
