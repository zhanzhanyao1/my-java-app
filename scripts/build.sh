#!/bin/bash
set -e

echo "Building project with Maven..."
mvn clean package -DskipTests
