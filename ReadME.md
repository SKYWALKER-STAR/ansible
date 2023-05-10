============================================================================================
+ Author: ming
+ CreateDate: 2023/5/10
+ LastModifyDate: 2023/5/10
+ Description: Ansible Playbook 一键部署Redis集群、哨兵 Readme 文档
============================================================================================

I.介绍
--------------------------------------------------------------------------------------------
	脚本是用来一键部署Redis集群、哨兵的Ansible PlayBook.目前的版本实现了在本地机器上让Redis服务
	运行在不同的端口上来模拟Redis集群、主从、哨兵。程序结构参见第二节，部署的Redis架构参见第三节。

II.代码结构
-------------------------------------------------------------------------------------------

startup.sh
	启动脚本，执行ansible playbook启动命令，调用install.ym文件，并且传入相关变量

install.yml
	调用所有playbook的文件,调用顺序为本文中文件排列顺寻

compile.yml
	编译redis源码。需要在启动时传入source变量，来指定源码位置。

configFile.yml
	为Redis创建配置文件目录,因为目前的版本是让多个redis实例监听在本地机器不同端口上,因此，该文件为每一个
	redis实例创建了一个目录，目录中用来放置redis配置文件

configFile_slave.yml
	生成redis slave配置文件，并且将它们存储在相应的目录下

configFile_sentinel.yml
	生成redis sentinel配置文件，并且将它们存储在相应的目录下

modifyfile.yml
	生成redis节点的配置文件，并且将它们存储在相应的目录下

Scripts.yml
	生成redis启停脚本、启动cluster的脚本、启动slave的脚本、启动sentinel的脚本

startRedis.yml
	启动redis主节点

startRedisCluster.yml
	启动redis集群

startSlave.yml
	启动redis slave

startSentinel.yml
	启动redis哨兵

III 部署架构
---------------------------------------------------------------------------------------------
1.集群
	如果是集群模式，则运行六个redis实例，分别运行在端口7001,7002,7003,7004,7005,7006
2.哨兵
	如果是哨兵模式，则启动三个哨兵，分别运行在端口26379，26380，26381
3.从节点
	本程序支持为7001端口的redis实例创建三个从节点，监听在7011，7012，7013端口
3.架构图
	参见pics/部署架构图
