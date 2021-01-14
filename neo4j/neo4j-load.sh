#!/usr/bin/env bash

set -e

NEO_HOME=/opt/neo4j

neoshell="$(NEO_HOME)/bin/cypher-shell -u neo4j -p neo"

rm -f ${NEO_HOME}/import/*
$(neoshell) "MATCH(n) DETACH DELETE n" || true
$(neoshell) "DROP CONSTRAINT unique_vm_id" || true
$(neoshell) "DROP CONSTRAINT unique_method_id" || true

cp $(REPORTS_DIR)/*.csv ${NEO_HOME}/import
time cat $(shell find $(REPORTS_DIR) -name '*.cypher') | $(neoshell)
