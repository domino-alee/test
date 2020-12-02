whoami; ls -latr /opt/bitnami/spark/conf; cat /opt/test/conf/spark-defaults.conf
RUN mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && chmod -R 777 /opt/test
echo "spark.authenticate true" >> /opt/test/conf/spark-defaults.conf
echo "spark.authenticate.secret Domino123!@#" >> /opt/test/conf/spark-defaults.conf
echo "spark.network.crypto.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.io.encryption.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.authenticate.enableSaslEncryption true" >> /opt/test/conf/spark-defaults.conf
cat /opt/test/conf/spark-defaults.conf
export SPARK_CONF_DIR=/opt/test/conf
env | grep SPARK
