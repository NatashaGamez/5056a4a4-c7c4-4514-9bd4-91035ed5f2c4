package example.d

import java.util.UUID

import example.a.model.Timestamp
import example.d.model.Visitor

object Main {

  def older(v1: Visitor, v2: Visitor): Boolean =
    v1.createdAt.seconds > v2.createdAt.seconds

  def getAnonymousUser(age: Int): Visitor = Visitor.Anonymous( //definimos el metodo
    UUID.randomUUID().toString,
    Timestamp(age))


  val getUser: Int => Visitor = (age: Int) => Visitor.User( //definimos la funcion
    id = UUID.randomUUID().toString,
    email = "email@example.com",
    createdAt = Timestamp(age)
  )

  // First case: sbt "runMain example.d.Main 100 90"
  // Second case: sbt "runMain example.d.Main 100 900"
  def main(args: Array[String]): Unit = {
    val Array(firstAge, secondAge) = args

    val a = getAnonymousUser(firstAge.toInt)
    val b = getUser(secondAge.toInt)

    // Print older user
    if (older(a, b)) a.show() else b.show()
  }
}
