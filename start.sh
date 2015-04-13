service zookeeper restart
mesos-master --work_dir=/var/log/mesos &
/op/marathon/bin/start --master zk://localhost:2181/mesos --zk zk://localhost:2181
