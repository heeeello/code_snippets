
# Please note: never put / after  original dirs. Or else rsync will copy the contents in dirs
# Never use --delete, It may delete all target dir's contents inadvently
rsync -ravzX --max-size=2g  dir1 dir2 dir3  root@${BACKUP_IP}:/backup_dir/

find . -size +2G  > bigfiles.txt


# then scp the big file. Too big file may fail with rsync (>4G) and not efficient with rsync

for i in `cat bigfiles.txt`; do dirname=`dirname $i`; scp $i root@BACKUP_IP:/backup_dir/$dirname/ ; done

