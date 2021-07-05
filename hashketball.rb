require "pry"
def game_hash
  game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1,
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7,
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15,
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5,
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1,
      },
    },
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2,
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10,
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5,
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0,
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12,
      },
    },
  },
  }
  game_hash
end
#Gregory Dwyer(TCF-technical coaching fellow)
         #make a helper method array_of_players
         #begining of the programs are structured ==> mini projects
         #5 mods. Every 3rd week dedicated to group project (2). Except for mod 5(solo).
         #Day begins with dicussion question. Average 1 lecture a day (1-2hr).
         #tons of labs for weeks - to do for hw
         #How much of REACT:
         #mod 1 Ruby, sequal (background understanding).
         #mod 2 Ruby on Rails; Active record (interactive with data bases-words and syntax[sequal querry])
         #Sinatra, like a small version of rails. Must be explicit. -expand understanding of Rails
         #mod 3 Javascript (plain)
         #mod 4 REACT (javascript library)
         #2 languages (Ruby + Javascript)
         #2 frameworks (Rails + REACT)
         #build mental stamina
         #hire within? yes. -Need basis, fairly competitive
def num_points_scored(name)
  game_hash.each do |destination, data|
    if data[:players].has_key?(name)
    return data[:players][name][:points]
    end
  end
end

def shoe_size(name)
  game_hash.each do |destination, data|
    if data[:players].has_key?(name)
    return data[:players][name][:shoe]
    end
  end
end

def team_colors(team)
  game_hash.each do |destination, data|
    if data.has_value?(team)
    return data[:colors]
    end
  end
end

def team_names
  # name_array = []
  game_hash.map {|destination, data| data[:team_name]}
    #  name_array << data[:team_name]
    #end
  # name_array
end
#=> ["Brooklyn Nets", "Charlotte Hornets"]


def player_numbers(team)
  numbers = []
  game_hash.each do |destination, data|
    if data.has_value?(team)
      data[:players].each do |player, stat|
        numbers << stat[:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |destination, data|
    if data[:players].has_key?(name)
        return data[:players][name]
      end
  end
end


def big_shoe_rebounds
  max_shoe = 0
  rebounds = 0
  game_hash.each do |destination, data|
    data[:players].each do |player, stat|
      if max_shoe < stat[:shoe]
        max_shoe = stat[:shoe]
        rebounds = stat[:rebounds]
      end
    end
   end
   return rebounds
end


# it 'returns the number of rebounds of the player with the biggest shoe size' do
