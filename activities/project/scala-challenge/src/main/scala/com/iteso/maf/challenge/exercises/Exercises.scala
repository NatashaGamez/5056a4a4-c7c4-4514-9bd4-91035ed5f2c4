package com.iteso.maf.challenge.exercises

import akka.http.scaladsl.server.Route
import akka.http.scaladsl.server.Directives._
import com.iteso.maf.challenge.exercises.problems._

case object Exercises {
  val route: Route = pathPrefix("problems") {
    Example.solution ~
    Problem1.solution ~
    Problem2.solution ~
    Problem3.solution ~
    Problem4.solution ~
    Problem5.solution ~
    Problem6.solution
  }
}
