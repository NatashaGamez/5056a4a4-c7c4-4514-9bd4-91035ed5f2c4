package mx.iteso.maf.spark.example.config

import org.apache.spark.sql.{SQLContext, SparkSession}

object Context {
  import Settings.Spark._

  def getOrCreateSpark(name: String = name): SparkSession = SparkSession.builder
    .appName(name)
    .config(Label.master, Value.master)
    .config(Label.driverMem, Value.driverMem)
    .getOrCreate()

  trait Spark {
    implicit val spark: SparkSession = getOrCreateSpark()
    implicit val sqlContext: SQLContext = spark.sqlContext
    spark.sparkContext.setLogLevel(logLevel)
  }
}
