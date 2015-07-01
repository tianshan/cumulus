#!/bin/sh

#stop hdfs first
#stop-dfs.sh

#set all the path
common_path=~/
common_name=hadoop-common-0.22.1-SNAPSHOT
hdfs_path=~/
hdfs_name=hadoop-hdfs-0.22.1-SNAPSHOT
conf_path=~/hdfs-conf/conf
temp=~/temp/
tempcumulus=/home/hadoop/temp/

hadoop=hadoop_installs

data1=$(date +%s)

#prepare th deploy dir
rm -rf $temp
mkdir $temp
rm -rf ~/hadoop_installs/
mkdir ~/hadoop_installs

#get each tar and conf into one folder
cp -R ${common_path}${common_name}".tar.gz" $temp
cp -R ${hdfs_path}${hdfs_name}".tar.gz" $temp
cp -R $conf_path $temp

tar -xzf ${common_path}${common_name}".tar.gz" -C ${temp}
tar -xzf ${hdfs_path}${hdfs_name}".tar.gz" -C ${temp}
cp -R ${temp}${common_name}"/." ${temp}${hadoop}
cp -R ${temp}${hdfs_name}"/." ${temp}${hadoop}
cp -Rf ${temp}"conf" ${temp}${hadoop}

cd ${temp}
cp -R ${hadoop}"/."  ~/hadoop_installs/

for var in dislab1 dislab2 dislab3 dislab4 dislab5 
do
	ssh $var "rm -rf hadoop_installs/"
	scp -r ~/hadoop_installs/ hadoop@$var:~/hadoop_installs/
	echo $var
done
wait
data2=$(date +%s)
echo "used time:"$(( data2 - data1 ))
