package mx.iteso.maf.spark.example

import org.apache.spark.sql._
import mx.iteso.maf.spark.example.config.{Context, Settings}

object Main extends Context.Spark {
  import spark.implicits._

  // Define data model
  final case class WordCount(word: String, count: Long)

  // Define functions
  def splitLine(line: String): Array[String] = line.split("""\s+""")

  def standardize(word: String): String =
    word.toLowerCase.replaceAll("[^A-Za-z0-9]", "")

  // Read raw data
  def getRawData(inputPath: String): Dataset[String] =
    spark.read.textFile(inputPath)

  // Perform word count
  def wordCount(inputPath: String): Dataset[WordCount] = ???

  def main(args: Array[String]): Unit = {

    // Arguments
    val inputPath: String = args.headOption.getOrElse(Settings.Data.read)
    val outputPath: String = Settings.Data.write

    // Calculate results
    val result = wordCount(inputPath).sort($"count".desc).cache()

    // Write, show, and close
    result.write.mode("OVERWRITE").csv(outputPath)
    result.show()
    spark.close()
  }
}
