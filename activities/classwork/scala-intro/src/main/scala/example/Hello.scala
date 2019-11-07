package example

object Hello {
  val default = "World"

  def greeting(name: String = default): String = "Hello"

}