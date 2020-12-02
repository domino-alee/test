whoami; ls -latr /opt/bitnami/spark/conf; cat /opt/test/conf/spark-defaults.conf
mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && chmod -R 777 /opt/test
echo "spark.authenticate true" >> /opt/test/conf/spark-defaults.conf
echo "spark.authenticate.secret Domino123!@#" >> /opt/test/conf/spark-defaults.conf
echo "spark.network.crypto.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.io.encryption.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.authenticate.enableSaslEncryption true" >> /opt/test/conf/spark-defaults.conf
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/test/conf/spark-env.sh
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/bitnami/spark/conf/spark-env.sh
cat /opt/test/conf/spark-defaults.conf
export SPARK_CONF_DIR=/opt/test/conf
env | grep SPARK
