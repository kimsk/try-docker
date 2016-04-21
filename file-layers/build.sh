#!/bin/bash
docker build -t test/a -f a.Dockerfile .
docker build -t test/b -f b.Dockerfile .
docker build -t test/ab -f ab.Dockerfile .
docker build -t test/ba -f ba.Dockerfile .
