#!/bin/bash



cd /app/Sources

mvn package

cp /app/config.ini /app/Sources/target/config.ini

cd /app/Sources/target

java -jar /app/Sources/target/Habbo-3.0.0-jar-with-dependencies.jar -Dfile.encoding=UTF-8 -Duser.country=EN -Duser.language=en