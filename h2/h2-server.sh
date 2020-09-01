#!/usr/bin/env bash

H2_HOME=${HOME}/.m2/repository/com/h2database/h2
VERSION=1.4.197

java -cp ${H2_HOME}/${VERSION}/h2-${VERSION}.jar org.h2.tools.Server -tcp
