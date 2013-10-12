// Machen Sie Folgendes:
// (1) Verwenden Sie foldLeft, um die Gesamtgröße einer Liste von Strings zu
// berechnen
val listOfStrings = List("This","is","a","List","of","Strings")
println(listOfStrings.foldLeft(0)((sum,string) => sum + string.length))

// (2) Schreiben Sie einen Zensur-Trait mit einer Methode, die die Schimpfwörter
// Mist und Verdammt durch Blupp und Piep ersetzt. Verwenden Sie eine Map, um
// die Schimpfwörter und ihre Alternativen zu speichern.
// (3) Laden Sie die Schimpfwörter und die Alternativen aus einer Datei.
trait Zensur {
  val dirtyWords = collection.mutable.HashMap[String,String]()
  for(line <- io.Source.fromFile("schimpfwörter").getLines) {
    val dirty = line.split(" ")(0)
    val clean = line.split(" ")(1)
    dirtyWords += dirty -> clean
  }
  def censor(s:String):String = {
    var tmpString = s
    dirtyWords.foreach(dirtyWord =>
        tmpString = tmpString.replaceAll(dirtyWord._1, dirtyWord._2)
    )
    tmpString
  }
}
class MyString(val value:String) extends Zensur
val fluch = new MyString("Verdammt nochmal, so ein Mist!")
println(fluch.censor(fluch.value))
