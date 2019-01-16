#!/bin/bash

## declare an array variable
declare -a arr=(
vnconfig04
vnfespare60
vnfespare61
vnfespare62
vngame57
vngame58
vngame59
vngame60
vngame61
vngame62
vngame63
vngame64
vngame65
vngame66
vngame67
vngame68
vngame69
vnmqevent04
vnmqevent05
vnmqevent06
vnmqlog04
vnmqlog05
vnmqlog06
vnmqpush07
vnmqpush08
vnmqpush09
vnmqpush10
vnmqpush11
vnmqpush12
vnmqrpc11
vnmqrpc12
vnmqrpc13
vnmqrpc14
vnmqrpc15
vnmqrpc16
vnmqrpc17
vnmqrpc18
vnmqrpc19
vnmqrpc20
vnmqspare09
)

#Check docker on each server in loop
for i in "${arr[@]}"
do
   salt $i cmd.run 'docker ps|wc -l' | tee -a /home/linxz/log/check.log
done

## now loop through the above array
for i in "${arr[@]}"
do
   salt $i state.sls hw_driver_update| tee -a /home/linxz/log/hw_driver_update.log
   salt $i cmd.run 'ethtool -i eno1|grep version' | tee -a /home/linxz/log/update_check.log
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also


