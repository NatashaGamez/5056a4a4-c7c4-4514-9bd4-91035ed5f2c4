package com.iteso.maf.challenge

import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Route
import com.iteso.maf.challenge.exercises.Exercises

object Server extends Context {
 val route: Route = Exercises.route

 def main(args: Array[String]): Unit = {
  Http().bindAndHandle(route, Settings.Http.host, Settings.Http.port)
 }
}
