#!/usr/bin/env bash
# AI-Based Student Career Recommendation System
# Execution script for Linux / macOS

echo "====================================================================="
echo " AI-BASED STUDENT CAREER RECOMMENDATION SYSTEM"
echo " College Design Thinking Project"
echo " Backend: Java Spring Boot | Database: SQLite | AI/ML: Java ML"
echo "====================================================================="

if ! command -v java &> /dev/null; then
    echo "[ERROR] Java is not installed or not in PATH."
    echo "Please install JDK 8, 11, 17, or 21 (e.g., sudo apt install openjdk-17-jdk or brew install openjdk)."
    exit 1
fi

echo "[OK] Java found: $(java -version 2>&1 | head -n 1)"

if command -v mvn &> /dev/null; then
    echo "[OK] Maven found. Bootstrapping Spring Boot application..."
    mvn spring-boot:run
else
    echo "[ERROR] Maven is not installed in PATH."
    echo "Please install Maven (e.g., sudo apt install maven or brew install maven)."
    exit 1
fi
