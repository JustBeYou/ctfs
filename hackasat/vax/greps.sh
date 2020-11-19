#!/bin/bash

grep -Pi "<[_a-z]+>:" server.s > functions.txt
grep -Pi "<[_a-z]+>:" server_relevant.s > functions_relevant.txt
grep -Pi "<[_a-z]+>" server_relevant.s > functions_relevant_and_calls.txt

