package example.c.model

case class Box[A](value: A) {

  def show(): Unit = println(value)

  def map[B](f: A => B): Box[B] = Box(f(value))

  def flatMap[B](fn: A => Box[B]): Box[B] = fn(value)

  def concat(other: Box[A]): Box[A] =
  Box(value.toString + other.toString)

}
