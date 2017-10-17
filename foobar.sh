#!/bin/bash

for i in {1..100}
do
  echo $i
  if (( $i %3 == 0 && $i % 5 == 0 )); then
     echo foobar
   elif (( $i % 3 == 0 )); then
        echo foo
   elif (( $i % 5 == 0 )); then
        echo bar
  fi
done
