#! /bin/bash

set -e

for VERSION in 8 9 11 15; do
  declare home_string=JAVA_${VERSION}_HOME
  if [ -z "${!home_string}" ]; then
    echo "Skipping test for Java ${VERSINO}"
    continue
  fi
  echo "Running tests with TEST_JAVA_HOME=${!home_string}"
  TEST_JAVA_HOME=${!home_string} BTRACE_TEST_DEBUG="true" ./gradlew test
done
