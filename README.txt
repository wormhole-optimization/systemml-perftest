# systemml-perftest

Things to do:

When running perftests in a new environment:
 - Edit systemml-perftest/perftest/sparkDML.sh
    - DEFAULT_SPARK_HOME should point to the spark root directory (download from https://spark.apache.org/downloads.html)
    - Configure default arguments to run on a different environment
       - local vs yarn config for cluster
       - driver memory
       - ...

To test a new implementation of SystemML:
 - run mvn package to generate the snapshot jar (systemml/target/system-ml-...-.jar)
 - replace the systemml-perftest/perftest/SystemML.jar with the new jar (renamed to match)

#####################################################################################################

From perftest README from SystemML:

HOW TO RUN THE PERFORMANCE SUITE
================================

Create a directory <...> on target machine on cluster, and copy from
repository SystemML/system-ml: machine/cluster:

   scripts/algorithms   to <...>/algorithms
   scripts/datagen      to <...>/datagen
   scripts/perftest     to <...>/perftest

Also copy:

   scripts/sparkDML.sh     to <...>/perftest/                     // Edit sparkDML and set SPARK_HOME and SYSTEMML_HOME.
   target/system-ml-5.0-SNAPSHOT.jar  to <...>/perftest/SystemML.jar
   test/config/SystemML-config.xml to <...>/perftest/SystemML-config.xml

   chmod -R +x <...>/./*                        // Change permissions


Customize in runAll*.sh to choose data sizes as well as in gen*Data.sh.


Following alternative run modes are supported from <...>/perftest/

   ./runAll.sh $1 $2                // run all test 

   ./runAll.sh myperftest SPARK     // example

   $1 is used as a relative path in hdfs to store generated data,
   intermediate results, etc. $2 can be MR, SPARK, or ECHO. ECHO is
   meant for debugging the scripts as it just goes through all the
   scripts and outputs the invoked command line parameters.

   The scripts append to a trace/time file ./times.txt, and output log
   files in folder ./logs/*

   Below scripts can be invoked accordingly, e.g.

   ./runAllBinomial.sh $1 $2
   ./runAllClustering.sh $1 $2
   ./runAllMultinomial.sh $1 $2
   ./runAllRegression.sh $1 $2
   ./runAllStats.sh $1 $2
   ./runAllDimensionReduction.sh $1 $2

   ./genBinomialData.sh $1 $2
   ./genMultinomialData.sh $1 $2
   ./genClusteringData.sh $1 $2
   ./genDescriptiveStatisticsData.sh $1 $2
   ./genStratStatisticsData.sh $1 $2
   ./genDimensionReductionData.sh $1 $2


