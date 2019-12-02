package example.exercises

object PrimeSearch {
 /**
  * Problem definition: Find all the prime numbers in between two natural numbers.
  *
  * Prime number is defined as a natural number grater than one that cannot be composed by with the multiplication
  * of two smaller natural numbers.
  *
  * Consider:
  *    - Using the option-type safely transform the input values.
  *    - Create your own tests for the isPrime function.
  *    - Return a string separated by commas: 2, 3, 5, 7, 11, 13
  */

 def isPrime(num: Int): Boolean = {
   if (num ==1) {
     return false
   }
   for (i<- 2  until num  ){
     if(num % i==0){
       return false
     }
   }
   return true

 }

  def main(args: Array[String]): Unit = {
    val Array(start, end) = args
    val a = start.toInt
    val b = end.toInt
    def result = (a to b).toList.filter(num => isPrime(num)).mkString(",")
    println(result)

  }

}
