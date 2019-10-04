cp ../systemml/target/systemml-1.3.0-SNAPSHOT.jar perftest/SystemML.jar;
cp perftest/SystemML-config.xml ../systemml/target/;
cd perftest
./runAllRegression.sh try-again SPARK
cd ..
