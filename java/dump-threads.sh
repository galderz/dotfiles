#!/bin/bash

kill -3 `ps ax | grep java | grep -v "grep java" | sed -e "s/ pts.*$//"`
