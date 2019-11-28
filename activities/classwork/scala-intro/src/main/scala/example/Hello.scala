package example


object Hello {
  val default = "World"

  //Greting function
  //Exprecion
  def greeting(name: String = default): String = { s"Hello, $name"}

  //Main method
  // run with: sbt "runMain example.Hello World"
  def main(args: Array[String]): Unit = {
    val name = args.headOption.getOrElse(default)
    println(greeting(name))
  }


  //val testA: (String, String) => String = (first_name: String, last_name: String) => first_name + last_name

  //def testB(first_name: String, last_name: String): String = ???

}