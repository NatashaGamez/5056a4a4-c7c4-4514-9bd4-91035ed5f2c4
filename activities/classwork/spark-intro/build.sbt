import Dependencies._

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "mx.iteso",
      scalaVersion := "2.11.12",
      version      := "0.1.0"
    )),
    name := "spark-wordcount",
    libraryDependencies ++= {
      val configVersion = "1.3.4"
      val sparkVersion = "2.4.4"
      Seq(
        "com.typesafe" % "config" % configVersion,
        // Spark
        "org.apache.spark" %% "spark-core"  % sparkVersion,
        "org.apache.spark" %% "spark-sql"   % sparkVersion,
        "org.apache.spark" %% "spark-mllib" % sparkVersion,
        // Test
        scalaTest % Test
      )
    },
    assemblyMergeStrategy in assembly := {
      case PathList("reference.conf")     => MergeStrategy.concat
      case "log4j.properties"             => MergeStrategy.last
      case "META-INF/services/org.apache.spark.sql.sources.DataSourceRegister" => MergeStrategy.concat
      case "META-INF/services/org.apache.hadoop.fs.FileSystem" => MergeStrategy.concat
      case PathList("META-INF", xs @ _*)  => MergeStrategy.discard
      case _ => MergeStrategy.first
    },
    javaOptions ++= Seq("-Xms512M", "-Xmx2048M", "-XX:MaxPermSize=2048M", "-XX:+CMSClassUnloadingEnabled")
  )
