package example.c

import example.c.model.Box

object Main {
    val numbers: List[Int] = List(1,2,3,4,5)

    def procedure(args: Array[Int]): Box[Int] =
        numbers.map(num => Box(num)).foldRight(Box(0)){
            case (elm, z) => z.concat(elm).map(_.toInt)
        }
    def main(args: Array[String]): Unit ={
        case valid if args.length > 0 => procedure(args.map(_.toInt)).show()
        case _ => println("Invalid argument.")

    }
}

// Valid case: sbt "runMain example.c.Main 1 2 3 4 5"
//Invalid case: sbt "runMain example.c.Main"