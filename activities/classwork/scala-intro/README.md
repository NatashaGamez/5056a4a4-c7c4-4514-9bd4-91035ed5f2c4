# Scala Intro

This project aims to provide a quick-tour of the scala programming language.
The main objective is to learn just enough scala to create Apache Spark JAR Jobs. 


Use the [essential scala](https://underscore.io/books/essential-scala/) book as a reference. 

Want more? Checkout the [scala exercises](https://www.scala-exercises.org) website!
## Setup

Install the following:

* Java 8 (check by running `java -version`)
    * General: Official Oracle download [here](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
    * Mac OS: `brew tap AdoptOpenJDK/openjdk & brew cask install adoptopenjdk8`
    * Debian-based OS: `sudo apt install openjdk-8-jdk`
* SBT - Scala Build Tool (check by running `sbt about`)
    * General: Official SBT download [here](https://www.scala-sbt.org/download.html)
    * Mac OS: `brew install sbt`
* IntelliJ IDEA Ultimate
    * Install via the [Toolbox App](https://www.jetbrains.com/toolbox-app/). 

## Usage

### Run main class

To run a main class:

```commandline
$ sbt "runMain example.Hello"
```

Add a commandline argument:

```commandline
$ sbt "runMain example.Hello there"
```


### Testing

Run all the tests at once:

```commandline
$ sbt test
```

Run an individual test:

```commandline
$ sbt "testOnly *HelloSpec"
```
