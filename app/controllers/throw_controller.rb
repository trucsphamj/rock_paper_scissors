class ThrowController < ApplicationController    

  def index
    render :intro
  end

  def rock
    if (@computer_throw == :rock)
      
    elsif (@computer_throw == @defeat[:rock])
      #$results[:player] += 1
    else
      #$results[:computer] += 1
    end
  end

  def paper
    if (@computer_throw == :paper)
      
    elsif (@computer_throw == @defeat[:paper])
      $results[:player] += 1
    else
      $results[:computer] += 1
    end

  end

  def scissors
    if (@computer_throw == :scissors)
      
    elsif (@computer_throw == @defeat[:scissors])
      $results[:player] += 1
    else
      $results[:computer] += 1
    end
  end

  def results   
  end

  def other
    @other = params[:other]
    render :error
  end

 end
