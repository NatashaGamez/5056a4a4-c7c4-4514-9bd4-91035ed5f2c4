package com.iteso.maf.challenge.exercises.problems

import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport
import Example.FibonacciResult
import spray.json.DefaultJsonProtocol
import Problem1.MixedString
import Problem2.SuperDigit
import Problem4.Calculation
import Problem5.IntListResult
import Problem6.{InterpolationFailure, InterpolationSuccess}

trait JsonSupport extends SprayJsonSupport with DefaultJsonProtocol {
  implicit val jsonFormatFibonacciResults = jsonFormat1(FibonacciResult)
  implicit val jsonFormatMixedString = jsonFormat3(MixedString)
  implicit val jsonFormatSuperDigit = jsonFormat3(SuperDigit)
  implicit val jsonFormatCalculation = jsonFormat4(Calculation)
  implicit val jsonFormatIntListResult = jsonFormat4(IntListResult)
  implicit val jsonFormatInterpolateSuccess = jsonFormat2(InterpolationSuccess)
  implicit val jsonFormatInterpolateFailure = jsonFormat3(InterpolationFailure)
}
