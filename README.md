Cumulus 演示版本
===

部署
---

dp.sh 为部署脚本
部署过程主要是将用户目录的`common包`、`hdfs包`、`配置文件`解压后合并到用户目录下的 `hadoop_installs`,
然后一次发送到各台机器。

集群启动
---

集群格式化
`hadoop namenode format`
集群启动，hdfs bin目录需要在PATH中
`start-dfs.sh`
简单的写文件
`hadoop fs put local online` 


注意事项
---

* 如果变更了机器，或者更换了NameNode节点，注意修改配置文件

* 部署前注意关闭各台机器的防火墙


待改进点
---

* 部署发送改成压缩包

