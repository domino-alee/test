mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && wget https://github.com/domino-alee/test/raw/master/keystore.jks && wget https://github.com/domino-alee/test/raw/master/truststore.jks && chmod -R 777 /opt/test
cd /opt && wget https://raw.githubusercontent.com/domino-alee/test/master/krb5.conf && wget https://github.com/domino-alee/test/raw/master/spark.headless.keytab && wget https://github.com/domino-alee/test/raw/master/spark.service.keytab && chmod 777 *keytab && chmod 777 krb5.conf
cd /opt && wget https://github.com/domino-alee/test/raw/master/hdpkerberos.tar.gz && wget https://raw.githubusercontent.com/domino-alee/test/master/jaas.conf && wget https://github.com/domino-alee/test/raw/master/spark.token && tar xzvf hdpkerberos.tar.gz && chmod -R 777 hadoop-binaries-configs && chmod 777 jaas.conf && chmod 777 spark.token
echo "spark.kerberos.access.hadoopFileSystems hdfs://ec2-107-20-103-193.compute-1.amazonaws.com:8020" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.keytab /opt/spark.service.keytab" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.principal spark/ip-10-99-121-113.ec2.internal@EC2.INTERNAL" >> /opt/test/conf/spark-defaults.conf
echo "java.security.auth.login.config /opt/jaas.conf" >> /opt/test/conf/spark-defaults.conf
echo "spark.executorEnv.HADOOP_TOKEN_FILE_LOCATION /opt/spark.token" >> /opt/test/conf/spark-defaults.conf
echo "spark.executor.extraJavaOptions -Djava.security.auth.login.config=/opt/jaas.conf" >> /opt/test/conf/spark-defaults.conf
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/test/conf/spark-env.sh
echo "HADOOP_TOKEN_FILE_LOCATION=/opt/spark.token" >> /opt/test/conf/spark-env.sh
echo "SPARK_DAEMON_JAVA_OPTS=\"-Djava.security.auth.login.config=/opt/jaas.conf -Djava.security.krb5.conf=/etc/krb5.conf\"" >> /opt/test/conf/spark-env.sh
echo "HADOOP_CONF_DIR=/opt/hadoop-binaries-configs/configs/hadoop/3.1.4.0-315/0" >> /opt/test/conf/spark-env.sh
env
cd /opt && kinit -kt spark.service.keytab spark/ip-10-99-121-113.ec2.internal@EC2.INTERNAL && klist
