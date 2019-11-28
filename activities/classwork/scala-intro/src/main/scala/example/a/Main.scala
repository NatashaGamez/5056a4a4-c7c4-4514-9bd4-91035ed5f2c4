package example.a

import example.a.model.Timestamp

object Main {
  def main(args: Array[String]): Unit={
    val Array(s1, s2) = args
    val t1 = Timestamp(seconds = s1.toInt)
    val t2 = Timestamp(seconds = s2.toInt)

    println(t1 + t2)
  }
}
