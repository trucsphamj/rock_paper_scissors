class ThrowController < ApplicationController

  def index
    render :intro
  end

  def rock
    if (@computer_throw == :paper)
      
    elsif (@computer_throw == @defeat[:paper])
      $results[:player] += 1
    else
      $results[:computer] += 1
    end
    #render :nothing => true
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

 end
