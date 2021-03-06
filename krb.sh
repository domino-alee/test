mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && chmod -R 777 /opt/test
cd /opt && wget https://github.com/domino-alee/test/raw/master/spark.headless.keytab && wget https://github.com/domino-alee/test/raw/master/spark.service.keytab && chmod 777 *keytab
cd /opt && wget https://github.com/domino-alee/test/raw/master/hdpkerberos.tar.gz && tar xzvf hdpkerberos.tar.gz && chmod -R 777 hadoop-binaries-configs

echo "spark.kerberos.keytab /opt/spark.service.keytab" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.principal spark/ip-10-99-121-113.ec2.internal@EC2.INTERNAL" >> /opt/test/conf/spark-defaults.conf
echo "spark.executorEnv.HADOOP_TOKEN_FILE_LOCATION /opt/spark.token" >> /opt/test/conf/spark-defaults.conf

echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/test/conf/spark-env.sh
echo "HADOOP_TOKEN_FILE_LOCATION=/opt/spark.token" >> /opt/test/conf/spark-env.sh
echo "HADOOP_CONF_DIR=/opt/hadoop-binaries-configs/configs/hadoop/3.1.4.0-315/0" >> /opt/test/conf/spark-env.sh

export SPARK_CONF_DIR=/opt/test/conf
export HADOOP_TOKEN_FILE_LOCATION=/opt/spark.token
export HADOOP_CONF_DIR=/opt/hadoop-binaries-configs/configs/hadoop/3.1.4.0-315/0

env
cd /opt && kinit -kt spark.service.keytab spark/ip-10-99-121-113.ec2.internal@EC2.INTERNAL && klist
spark-submit --class org.apache.hadoop.hdfs.tools.DelegationTokenFetcher "" --renewer null /opt/spark.token
