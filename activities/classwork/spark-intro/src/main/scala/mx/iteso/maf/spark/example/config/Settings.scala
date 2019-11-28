package mx.iteso.maf.spark.example.config

import com.typesafe.config.{Config, ConfigFactory}

object Settings {
  private val app: Config = ConfigFactory.load().getConfig("application")
  object Spark {
    private val spark: Config = app.getConfig("spark")
    val name: String = spark.getString("name")
    val logLevel: String = spark.getString("loglevel")
    object Label {
      private val label: Config = spark.getConfig("label")
      val master: String = label.getString("master")
      val driverMem: String = label.getString("drivermem")
    }
    object Value {
      private val value: Config = spark.getConfig("value")
      val master: String = value.getString("master")
      val driverMem: String = value.getString("drivermem")
    }
  }
  object Data {
    private val data: Config = app.getConfig("data")
    val read: String  = data.getString("read")
    val write: String = data.getString("write")
  }
}