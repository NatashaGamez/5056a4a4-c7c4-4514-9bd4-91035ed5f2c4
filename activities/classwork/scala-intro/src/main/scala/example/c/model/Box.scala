package example.c.model

case class Box[A](value: A) {

  def map[B](f: A => B): Box[B] = Box(f(value))

  def flatMap(f: A => Box[A]): Box[A] = f(value)

}
