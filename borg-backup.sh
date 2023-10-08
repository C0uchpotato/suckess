#!/bin/bash
#

backup_dir=$(date +'%m-%d-%Y')
borg create -vp --stats /run/media/jhelmer/CDD7-B063/borg/::${backup_dir} /home/jhelmer
