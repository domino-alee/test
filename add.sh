whoami; ls -latr /opt/bitnami/spark/conf; cat /opt/test/conf/spark-defaults.conf
mkdir /opt/test && cd /opt/test && cp -r /opt/bitnami/spark/conf/ . && wget https://github.com/domino-alee/test/raw/master/keystore.jks && wget https://github.com/domino-alee/test/raw/master/truststore.jks && chmod -R 777 /opt/test
echo "spark.authenticate true" >> /opt/test/conf/spark-defaults.conf
echo "spark.authenticate.secret Domino123!@#" >> /opt/test/conf/spark-defaults.conf
echo "spark.network.crypto.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.io.encryption.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.authenticate.enableSaslEncryption true" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.enabled true" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.ui.port 8080" >> /opt/test/conf/spark-defaults.conf
echo "spark.master.ui.port 7680" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.keyStore /opt/test/keystore.jks" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.keyPassword Domino123" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.keyStorePassword Domino123" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.protocol TLSv1.2" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.needClientAuth true" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.trustStore /opt/test/truststore.jks" >> /opt/test/conf/spark-defaults.conf
echo "spark.ssl.trustStorePassword Domino123" >> /opt/test/conf/spark-defaults.conf
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/test/conf/spark-env.sh
echo "SPARK_CONF_DIR=/opt/test/conf" >> /opt/bitnami/spark/conf/spark-env.sh
cat /opt/test/conf/spark-defaults.conf
export SPARK_CONF_DIR=/opt/test/conf
