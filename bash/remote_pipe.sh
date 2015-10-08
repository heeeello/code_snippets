#!/bin/bash


cat id_ras.pub | ssh $TARGET_HOST "cat - >>~/.ssh/authorzied_keys"
