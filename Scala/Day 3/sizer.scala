import scala.io._
import scala.actors._
import Actor._

class PageSize(val value:Int)
class LinkCount(val value:Int)
class PageLoader(url: String) {
  val source = Source.fromURL(url,"latin1").mkString
  def getPageSize = new PageSize(source.length)
  def getLinkCount = {
    val rx = """(?i)<a""".r
    new LinkCount((rx findAllIn source) length)
  }
}

val urls = List("http://www.amazon.com/",
               "http://www.twitter.com/",
               "http://www.google.com/",
               "http://www.reddit.com/",
               "http://www.imgur.com/",
               "http://www.9gag.com/",
               "http://www.cuteoverload.com/",
               "http://www.youtube.com/",
               "http://www.cnn.com/" )

def timeMethod(method: () => Unit) = {
 val start = System.nanoTime
 method()
 val end = System.nanoTime
 println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
 for(url <- urls) {
   val p = new PageLoader(url)
   println("Size for " + url + ": " + p.getPageSize.value)
   println("Linkcount for "+ url + ": " + p.getLinkCount.value)
 }
}

def getPageSizeConcurrently() = {
 val caller = self

 for(url <- urls) {
   actor {
     val p = new PageLoader(url)
     caller ! (url, p.getPageSize)
     caller ! (url, p.getLinkCount)
   }
 }

 for(i <- 1 to 2*urls.size) {
   receive {
     case (url, size:PageSize) =>
       println("Size for " + url + ": " + size.value)
     case (url, count:LinkCount) =>
       println("Linkcount for " + url + ": " + count.value)
   }
 }
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
