CC = g++
HADOOP_INSTALL = /opt/mapr/hadoop/hadoop-2.7.0
INC = -I$(HADOOP_INSTALL)/include
LIBS = -L$(HADOOP_INSTALL)/lib/native -lhadooppipes -lhadooputils -lpthread -lssl -lcrypto
CPPFLAGS = $(INC) -Wall -g -O2

wordcount: wordcount.cpp
	$(CC) $(CPPFLAGS) -o $@ $< $(LIBS)
