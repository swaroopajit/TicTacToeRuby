class TicTacToe

    def initialize(player1Choice,player2Choice)
        @player1Choice = player1Choice
        @player2Choice = player2Choice
    end

    def gameStart
        @gameboard = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
        @lastX = 0
        @lastY = 0
    end

    def player1Move(x_index,y_index)
        if(@gameboard[x_index][y_index] != nil)
            puts "You can't make this move"
            return false
        else
            @gameboard[x_index][y_index] = @player1Choice
            @lastX = x_index
            @lastY = y_index
            return true
        end
    end

    def player2Move(x_index,y_index)
        if(@gameboard[x_index][y_index] != nil)
            puts "You can't make this move"
            return false
        else
            @gameboard[x_index][y_index] = @player2Choice
            @lastX = x_index
            @lastY = y_index
            return true
        end
    end

    def checkWin
        xLine = @gameboard[@lastX]
        yLine = []
        yLine.push(@gameboard[0][@lastY])
        yLine.push(@gameboard[1][@lastY])
        yLine.push(@gameboard[2][@lastY])
        player1Win = (xLine.all? {|place| place == @player1Choice}) or (yLine.all? {|place| place == @player1Choice})
        player2Win = (xLine.all? {|place| place == @player2Choice}) or (yLine.all? {|place| place == @player2Choice})
        draw = false
        allFilled = @gameboard.all?{|row|row.all?{|elem| elem != nil}}
        if player1Win == false and player2Win == false and allFilled == true 
            draw = true
        end
        if player1Win
            puts "Player 1 wins!" 
            return true
        elsif player2Win
            puts "Player 2 wins!"
            return true
        elsif draw == true
            puts "Tie!"
            return true
        end
        return false
    end

    def printBoard
        for i in 0..2 do
            for j in 0..2 do
                if(@gameboard[i][j] == nil)
                    print("_\t")
                else
                    print("#{@gameboard[i][j]}\t")
                end
            end
            puts ""
        end
    end
end

puts "Enter player1's choice(x or o):"
validInput = false
while validInput == false
    player1 = gets.chomp
    if player1 == "x"
        player2 = "o"
        validInput = true
    elsif player1 == "o"
        player2 = "x"
        validInput = true
    else
        validInput = false
        puts "Invalid input!"
    end
end
game = TicTacToe.new(player1,player2)
game.gameStart
puts "Type the x co-ordinate, press enter, then do the same for the y co-ordinate (both co-ordinates have range from 1 to 3)"
counter = 1
while game.checkWin == false
    puts "Player #{counter}'s turn"
    x = gets.chomp.to_i
    y = gets.chomp.to_i
    x -=1
    y -=1
    if(x<3 and y<3 and x>=0 and y>=0)
        if counter == 1
            if (game.player1Move(x,y))
                counter = 2
            end
        else
            if(game.player2Move(x,y))
                counter = 1
            end
        end
        game.printBoard
    else
        puts "Please enter valid positions"
    end
end