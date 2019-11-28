package example.b
import example.b.model.Person
object Main {
  def main(args: Array[String]): Unit= {
    args match {
      case Array(familyName) => println(familyName)
      case Array(familyName, nameA) =>
        val a = Person(nameA, familyName, gender = Person.Gender.undefined)
        println(a)
      case Array(familyName, nameA, nameB) =>
        val a = Person(nameA, familyName, gender = Person.Gender.undefined)
        val b = Person(nameB, familyName, gender = Person.Gender.undefined)
        println(a.greeting(b))
      case _ => println("Invalid arguments")
    }
  }
}
