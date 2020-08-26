#!/bin/bash 

arr=(a b c)
tmp=${arr[@]}
echo ${tmp// /"~~~"}
echo ' ';
