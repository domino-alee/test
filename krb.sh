mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && wget https://github.com/domino-alee/test/raw/master/keystore.jks && wget https://github.com/domino-alee/test/raw/master/truststore.jks && chmod -R 777 /opt/test
cd /opt && wget https://raw.githubusercontent.com/domino-alee/test/master/krb5.conf && wget https://github.com/domino-alee/test/raw/master/spark.headless.keytab && wget https://github.com/domino-alee/test/raw/master/spark.service.keytab && chmod 777 *keytab && chmod 777 krb5.conf
cd /opt && wget https://github.com/domino-alee/test/raw/master/hdpkerberos.tar.gz && tar xzvf hdpkerberos.tar.gz && chmod -R 777 hadoop-binaries-configs
echo "spark.kerberos.access.hadoopFileSystems hdfs://ec2-107-20-103-193.compute-1.amazonaws.com:8020" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.keytab /opt/spark.service.keytab" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.principal spark/ip-10-99-121-113.ec2.internal@EC2.INTERNAL" >> /opt/test/conf/spark-defaults.conf
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/test/conf/spark-env.sh
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/bitnami/spark/conf/spark-env.sh
export SPARK_CONF_DIR=/opt/test/conf
export HADOOP_CONF_DIR=/opt/hadoop-binaries-configs/configs/hadoop/3.1.4.0-315/0
env
