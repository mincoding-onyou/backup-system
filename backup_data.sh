count=`ls -l /mnt/backup | grep .zip | wc -l`

echo $count

#zip 파일 갯수 파익하기(7개 이상이면 가장 나중에 만든 파일 삭제)
if [ $count -gt 7 ]
then
    #가장 나중에 만든 파일가져오기 
    delete_data=`ls -ltr /mnt/backup | tail -n +2 | head -1 | awk '{print $9}'`
    sudo rm -r /mnt/backup/$delete_data
fi


#zip 프로세스 진행하기 
today=`date +%Y-%m-%d_%H:%M`

sudo zip -r /mnt/backup/$today /mnt/data

echo $today

#if [1 -gt 7]; then
#    echo "directory is not empty#"
#else
#    echo "directory is empty"
#fi
# sudo zip -r data backup/$(date +"%Y-%m-%d-%H-%M")


