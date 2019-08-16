# ecFlowR 0.0.0.9000

## Context
This package is designed to aid:
- the creation of ecFlow suites from within R
- the interaction native R task with an ecflow server

It also allows for the ecflow\_client command line tool to be used for certain
calls to the ecflow server to allow for R scripts to be used for tasks without
shell script wrapper. 

## New Features
- Functions to generate a suite definition file from within R support from
  most basic components
- Functions wrapping calls to the ecflow_client command line tool for
  interacting with the ecflow server from within R scripts, some are untested.
