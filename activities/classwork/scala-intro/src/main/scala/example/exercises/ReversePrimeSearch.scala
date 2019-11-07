package example.exercises

object ReversePrimeSearch {
 /**
  * Problem definition: Find all the reverse-prime numbers in between two natural numbers.
  *
  * A reverse-prime number is defined as a prime number that when "read backwards" is also a prime number.
  * Example: 17 is a reversible prime number.
  *
  * Consider:
  *    - Using the option-type safely transform the input values.
  *    - Use scala implicits to transform from String => Option[Long]
  *    - Create your own tests for the isReversePrime function.
  *    - Return a string separated by commas: 13, 17, 31, 37
  */

  def isReversePrime(num: Long): Boolean = ???

  def main(args: Array[String]): Unit = {
    val Array(start, end) = args

    println(start)
  }

}
