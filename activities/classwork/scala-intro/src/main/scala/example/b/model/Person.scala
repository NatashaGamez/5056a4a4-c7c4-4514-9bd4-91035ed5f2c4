package example.b.model

case class Person(firstName: String, lastName: String, gender: String){

  def greeting(other: Person): String = other.gender match {
    case Person.Gender.male => s"Guten Tag, Herr ${other.lastName}"
    case Person.Gender.female => s"Guten Tag, Frau ${other.lastName}"
    case _=> "Guten Tag"
  }
}

  object Person{
    object Gender{
      val male = "male"
      val female = "female"
      val undefined = "undefined"
    }
  }


