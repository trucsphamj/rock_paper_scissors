require 'sinatra'

$results = Hash.new(0)

before do
  content_type :html
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper,  lizard: :spock, spock: :rock}
  @beat = {rock: :lizard, paper: :spock, scissors: :lizard, lizard: :paper, spock: :scissors}
  @throws = @defeat.keys
  $results = Hash.new(0)
end

['/', '/throw', '/throw/'].each do |route|
  get route do
  "<p><h3> Game rules: </h3></p>
  <p>scissor eats paper<br/>
  paper covers rock<br/>
  rock crushes lizard<br/>
  lizard poison spock<br/>
  spock smashes scissors<br/>
  scissors decapitates lizard<br/>
  lizard eats paper<br/>
  paper disproves spock<br/>
  spock vaporizes rock<br/>
  rock crushes scissors</p>
  <p>You play against the computer. Enter your choice in the URL (i.e.  http://localhost:4567/throw/choice )<br/>
   As an example, enter http://localhost:4567/throw/rock  if you want to throw rock</p>
  <p>Or click on the following links to play directly<br/>
     <a href = http://localhost:4567/throw/rock>Throw rock</a><br/>
     <a href = http://localhost:4567/throw/paper>Throw paper</a><br/>
     <a href = http://localhost:4567/throw/scissors>Throw scissors</a><br/>
     <a href = http://localhost:4567/throw/lizard>Throw lizard</a><br/>
     <a href = http://localhost:4567/throw/spock>Throw spock</a><br/><br/>
     <a href = http://localhost:4567/stats>Game Scores</p>"
  end
end
 
get '/throw/:type' do
  player_throw = params[:type].to_sym
  if !@throws.include?(player_throw)
    halt 403, "<h4>You must throw one of the following: #{@throws}</h4>"
  end

  computer_throw = @throws.sample

  if player_throw == computer_throw
    "<h4>You tied with the computer. Try again!</h4>"
  elsif ((computer_throw == @defeat[player_throw]) || (computer_throw == @beat[player_throw]))
    $results['player'] += 1
    "<h4>Nicely done; #{player_throw} beats #{computer_throw}!</h4>"
  else
    $results['computer'] += 1
    "<h4>Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!</h4>"
  end
end

get '/stats' do
  "<h4>Player's wins: #{$results['player']}<br/>
Computer's wins: #{$results['computer']}</h4>"
end
