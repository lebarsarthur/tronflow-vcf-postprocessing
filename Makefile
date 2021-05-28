
all : clean test check

clean:
	rm -rf output
	#rm -rf work
	rm -f report.html*
	rm -f timeline.html*
	rm -f trace.txt*
	rm -f dag.dot*
	rm -f .nextflow.log*
	rm -rf .nextflow*

test:
	nextflow main.nf -profile test,conda --output output/test1
	nextflow main.nf -profile test,conda --output output/test2 --filter PASS
	nextflow main.nf -profile test,conda --output output/test3 --skip_split_mnps

check:
	test -s output/test1/sample1/sample1.normalized.vcf || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/test1/sample2/sample2.normalized.vcf || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/test1/sample3/sample3.normalized.vcf || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/test1/sample4/sample4.normalized.vcf || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/test2/sample1/sample1.normalized.vcf || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/test2/sample2/sample2.normalized.vcf || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/test2/sample3/sample3.normalized.vcf || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/test2/sample4/sample4.normalized.vcf || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/test3/sample1/sample1.normalized.vcf || { echo "Missing test 3 output file!"; exit 1; }
	test -s output/test3/sample2/sample2.normalized.vcf || { echo "Missing test 3 output file!"; exit 1; }
	test -s output/test3/sample3/sample3.normalized.vcf || { echo "Missing test 3 output file!"; exit 1; }
	test -s output/test3/sample4/sample4.normalized.vcf || { echo "Missing test 3 output file!"; exit 1; }
