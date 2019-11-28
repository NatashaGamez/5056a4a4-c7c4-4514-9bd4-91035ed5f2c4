package example

import org.scalatest._

class HelloSpec extends FlatSpec with Matchers {
  "The Hello object" should "say hello" in {
    Hello.greeting().toLowerCase() shouldEqual "hello, world!"
  }

  it should "say 'hello test-a'" in {
    val greeting = Hello.greeting(name = "test-a").toLowerCase
    greeting shouldEqual "hello, test-a!"
  }
}
