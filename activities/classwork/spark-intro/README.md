# Apache Spark Intro

This project contains a simple word-count exercise based on the [Gutenberg Project](https://www.gutenberg.org/). 

## Setup

The setup is straightforward: 

1. Go to the base directory of this project and test sbt with: `sbt about`
2. Run the script to download the data: `bash gutenberg.sh`
    * Approx 37K books will be downloaded as txt files (~ 14GB)
    * Expect several hours of download depending on your network speed. 

**Sample dataset**

Alternatively, you can use a sample of 50 books contained in `gutenberg-50.tar.gz`.

* Extract the contents: `tar -xzf gutenberg-50.tar.gz`
* Rename the output folder: `mv gutenberg-50 gutenberg`

Or download the sample from [this google drive](https://drive.google.com/drive/folders/18m0PlkEEYX2YImTy6P0WnAj2rwht9ezJ?usp=sharing). 

## Using the console

Open the SBT scala console with: `sbt -Dscala.color console`

Setup the spark session:
* `import mx.iteso.maf.spark.example.config._`
* `val spark = Context.getOrCreateSpark("console")`
* `spark.sparkContext.defaultParallelism`
* `import spark.implicits._`

Test with the following: 

```scala
val example = 1 to 10000
val data = spark.createData(example)
data.filter(_ % 2 == 0).show()
```

To quit the console:
* Close spark with: `spark.close()`
* Exit the console: `:q`

## Compile

You can run the application with SBT or compile and submit a spark-job.

**Run with SBT**

Use SBT to run the Spark Application with: `sbt run`

**Compile and submit**

Compile a fatjar with `sbt assembly` and use the resulting `.jar` 
in `target/scala-2.11/spark-wordcount-assembly-0.1.0.jar` to submit the job. 
