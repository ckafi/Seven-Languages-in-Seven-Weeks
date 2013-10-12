// Machen Sie Folgendes:
//   - Entwickeln Sie ein Spiel, das ein Tic-Tac-Toe-Spielbrett mit X,O und
//   Leerzeichen füllt und den Gewinner ermittelt oder ob ein Unentschieden
//   vorliegt. Verwenden Sie Klassen an passenden Stellen.
//   - Zusatzaufgabe: Lassen Sie zwei Spieler Tic-Tac-Toe spielen.

class Player(val name:String, val symbol:Char)


class Box {
  var occupiedBy:Option[Player] = None

  def setPlayer(player:Player) = {
    occupiedBy = Some(player)
  }

  def isFree:Boolean = occupiedBy == None
}


class Board {
  private var board = Array.fill(3,3){new Box}

  def boxAtCoords(coords:String):Box = {
    val row = Integer.parseInt(coords.charAt(1).toString) - 1
    val column = coords.charAt(0).toInt - 'a'.toInt
    return board(row)(column)
  }

  def setBox(coords:String, player:Player) = {
    boxAtCoords(coords).setPlayer(player)
  }

  def drawBoard = {
    println("    a   b   c  ")
    println("  -------------")
    var rowNumber = 1
    for(row <- board) {
      print(rowNumber+" ")
      for(box <- row) {
        val playerSymbol = box.occupiedBy.getOrElse(new Player("",' ')).symbol
        print("| "+playerSymbol+" ")
      }
      println("|")
      println("  -------------")
      rowNumber += 1
    }
  }

  def whoWon:Option[Player] = {
    val boardWithPlayers = board.map(row => row.map(_.occupiedBy))

    val rows = boardWithPlayers
    // man, sometimes I miss Lisp
    val columns = (boardWithPlayers(0), boardWithPlayers(1), boardWithPlayers(2)).zipped.map(Array(_,_,_))
    val diags = Array(Array(boardWithPlayers(0)(0), boardWithPlayers(1)(1), boardWithPlayers(2)(2)),
                      Array(boardWithPlayers(2)(0), boardWithPlayers(1)(1), boardWithPlayers(0)(2)))

    // for(c <- Array(rows,columns,diags)) {
    for(c <- Array(rows,columns,diags)) {
      for(triplet <- c) {
        val set = triplet.toSet
        if(set.size == 1 && set.head != None) return set.head
      }
    }
    return None
  }
}


object TicTacToe {
  def main(args: Array[String]) = {
    println("Lets play some Tic Tac Toe!")
    print("Player 1, what's your name? ")
    val player1 = new Player(Console.readLine,'X')
    println("Ok "+player1.name+", your symbol is X")
    println()
    print("Player 2, what's your name? ")
    val player2 = new Player(Console.readLine,'O')
    println("Ok "+player2.name+", your symbol is O")

    val board = new Board
    var player = player1
    while(board.whoWon == None) {
      println()
      println()
      board.drawBoard
      println()

      print(player.name + ", it's your move: ")
      var coords = Console.readLine
      while(!board.boxAtCoords(coords).isFree) {
        print("That's already taken. Your move: ")
        coords = Console.readLine
      }
      board.setBox(coords, player)

      if(player == player1) player = player2 else player = player1
    }

    println()
    println()
    board.drawBoard
    println()
    if(board.whoWon == None) println("That's a draw.")
    else println("Congratulations "+board.whoWon.get.name+", you won!")
  }
}

TicTacToe.main(Array())
