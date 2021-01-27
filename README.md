# Hadoop C++ WordCount

This project contains information regarding compiling the C++ WordCount implementation found [here][wordcount_link] with Hadoop, as the original guide (and some other Hadoop C++ tutorials).

[wordcount_link]: http://cs.smith.edu/dftwiki/index.php/Hadoop_Tutorial_2.2_--_Running_C%2B%2B_Programs_on_Hadoop
[apache_hadoop_doc]: https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html

## Compile WordCount

Clone this project on hadoop client node and build:

```bash
git clone https://github.com/amitjn1/hadoop-wordcount-cpp wordcount
cd wordcount
make -j4
```

## Initialize Hadoop, Run WordCount

In HDFS, copy the WordCount binary and sotu_2015.txt:

```bash
hadoop fs -mkdir wordcount
hadoop fs -mkdir wordcount/input
hadoop fs -put wordcount wordcount/.
hadoop fs -put sotu_2015.txt wordcount/input/.
```

Finally run WordCount on the supplied sotu_2015.txt (2015 State of the Union address) test file:

```bash
bin/mapred pipes -D hadoop.pipes.java.recordreader=true \
                 -D hadoop.pipes.java.recordwriter=true \
                 -input wordcount/input/sotu_2015.txt   \
                 -output wordcount/output               \
                 -program wordcount/wordcount
```

To see the results:

```bash
hadoop fs -cat wordcount/output/part-00000
```
