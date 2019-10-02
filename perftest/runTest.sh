cp ../../systemml/target/systemml-1.3.0-SNAPSHOT.jar ./SystemML.jar;
cp SystemML-config.xml ../../systemml/target/;
./runAllRegression.sh try-again SPARK
