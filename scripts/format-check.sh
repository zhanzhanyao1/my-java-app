#!/bin/bash
set -e

echo "Running Spotless format check..."
mvn spotless:check
