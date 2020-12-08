mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && wget https://github.com/domino-alee/test/raw/master/keystore.jks && wget https://github.com/domino-alee/test/raw/master/truststore.jks && chmod -R 777 /opt/test
echo "spark.kerberos.access.hadoopFileSystems hdfs://ec2-107-20-103-193.compute-1.amazonaws.com:8020" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.keytab /etc/spark.service.keytab" >> /opt/test/conf/spark-defaults.conf
echo "spark.kerberos.principal spark/ip-10-99-121-113.ec2.internal@EC2.INTERNAL" >> /opt/test/conf/spark-defaults.conf
echo "spark.kubernetes.kerberos.krb5.path /etc/krb5.conf" >> /opt/test/conf/spark-defaults.conf
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/test/conf/spark-env.sh
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/bitnami/spark/conf/spark-env.sh
cat /opt/test/conf/spark-defaults.conf
export SPARK_CONF_DIR=/opt/test/conf
