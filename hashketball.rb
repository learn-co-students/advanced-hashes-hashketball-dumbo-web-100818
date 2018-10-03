require "pry"


def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players =>{
        "Alan Anderson"=> {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
    }},
    :away => {
       :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>{
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
    }
    }
  }
end

######################################################################

def num_points_scored (playername) 

game_hash[:home][:players].each do |player, playerstats|
  if player == playername 
    return playerstats[:points]
  end 
end
game_hash[:away][:players].each do |player, playerstats|
  if player == playername 
    return playerstats[:points]
  end 
end 
end 

######################################################################

def shoe_size (playername)
game_hash[:home][:players].each do |player, playerstats|
  if player == playername 
    return playerstats[:shoe]
  end 
end
game_hash[:away][:players].each do |player, playerstats|
  if player == playername 
    return playerstats[:shoe]
  end 
end 
end 

######################################################################

def team_colors(teamname)
  if game_hash.dig(:home, :team_name) == teamname
   return game_hash.dig(:home, :colors)
    
else
   if game_hash.dig(:away, :team_name) == teamname
   return game_hash.dig(:away, :colors)
end 
end
end

######################################################################

def team_names
 [game_hash[:home][:team_name],game_hash[:away][:team_name]]
end

######################################################################
  
def player_numbers(teamname)
  if game_hash[:home][:team_name]== teamname
  homenumbers =[]
 game_hash[:home][:players].each do |playername, playerstats|
      homenumbers << playerstats[:number]
      end 
      return homenumbers 
elsif game_hash[:away][:team_name]== teamname
awaynumbers = []
 game_hash[:away][:players].each do |playername, playerstats|
      awaynumbers << playerstats[:number]
      end 
      return awaynumbers
      end  
      end 
  
######################################################################
      
def player_stats(playername)
 game_hash[:home][:players].each do |player, playerstats|
  if player == playername 
    return playerstats
  end 
end
game_hash[:away][:players].each do |player, playerstats|
  if player == playername 
    return playerstats
  end 
end 
end 

######################################################################

def big_shoe_rebounds 
shoe_sizes = []
#home
game_hash[:home][:players].each{|playername, playerstats| shoe_sizes << playerstats[:shoe]}
#away
game_hash[:away][:players].each{|playername, playerstats| shoe_sizes << playerstats[:shoe]}
#home check
game_hash[:home][:players].each do |playername, playerstats|
if playerstats[:shoe] == shoe_sizes.sort![-1]
return playerstats[:rebounds]
end
end 
#awaycheck
game_hash[:away][:players].each do |playername, playerstats|
if playerstats[:shoe] == shoe_sizes.sort![-1]
return playerstats[:rebounds]
end
end 
end

############################################################################################################################################################################### B O N U S ###############################

#1: Which player has the most points ?
def most_points_scored
points_array = []
#home
game_hash[:home][:players].each{|playername, playerstats| points_array << playerstats[:points]}
#away
game_hash[:away][:players].each{|playername, playerstats| points_array << playerstats[:points]}
#home check
game_hash[:home][:players].each do |playername, playerstats|
if playerstats[:points] == points_array.sort![-1]
return playername
end
end 
#awaycheck
game_hash[:away][:players].each do |playername, playerstats|
if playerstats[:points] == points_array.sort![-1]
return playername
end
end 
end

most_points_scored

#2. Which team has the most points? 
def winning_team
if game_hash[:home][:players].include?(most_points_scored)
return game_hash[:home][:team_name]
else return game_hash[:away][:team_name]
end
end 

winning_team

#3. Which player has the longest name? 
def player_with_longest_name 
name_lengths = []
#home
game_hash[:home][:players].each{|playername, playerstats| name_lengths << playername.length}
#away
game_hash[:away][:players].each{|playername, playerstats| name_lengths << playername.length}
#home check
game_hash[:home][:players].each do |playername, playerstats|
if playername.length == name_lengths.sort![-1]
return playername
end
end 
#awaycheck
game_hash[:away][:players].each do |playername, playerstats|
if playername.length == name_lengths.sort![-1]
return playername
end
end 
end

player_with_longest_name

######################################################################################################################################################################S U P E R    B O N U S ############################

def long_name_steals_a_ton?
  steals_array = []
#home
game_hash[:home][:players].each{|playername, playerstats| steals_array << playerstats[:steals]}
#away
game_hash[:away][:players].each{|playername, playerstats| steals_array << playerstats[:steals]}
#home check
game_hash[:home][:players].each do |playername, playerstats|
if playerstats[:steals] == steals_array.sort![-1]
return playername == player_with_longest_name
end
end 
#awaycheck
game_hash[:away][:players].each do |playername, playerstats|
if playerstats[:steals] == steals_array.sort![-1]
return playername == player_with_longest_name
end
end
end
