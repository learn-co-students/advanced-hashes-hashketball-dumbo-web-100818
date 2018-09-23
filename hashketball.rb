require "pry"
# Write your code here!
def game_hash
   { :home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"],
     :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12,
     :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
     "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12,
      :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
     "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19,
      :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
     "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12,
      :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
     "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2,
      :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
    }
    },
     :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],
       :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1,
       :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
       "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4,
        :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
       "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12,
        :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
       "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3,
        :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
       "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12,
        :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
      }
}
end


def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, players_data|
          if player == name
            return players_data[:points]
          end
        end
      end
    end
  end
end



def shoe_size(name)
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

      if attribute == :players
        data.each do |player, players_data|
          if player == name
            return players_data[:shoe]

          end
        end
      end
    end
  end
end



def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data.value?(team_name)
      return team_data[:colors]

    end
  end
end


def team_names
game_hash.collect do |location, team_data|
team_data[:team_name]
end
end

def player_numbers(name)
array_of_numbers = []
game_hash.each do |location, team_data|
  if team_data[:team_name] == name
    team_data.each do |attribute, info|
      if attribute == :players
       info.each do |players_name, stats|
          array_of_numbers << stats[:number]
       end
      end
    end
   end
 end
array_of_numbers.sort
end

def player_stats(name)

game_hash.each do |location, team_data|
   team_data.each do |attribute, info|
     if attribute == :players
       info.each do |players_name, stats|
         if players_name == name
           return stats
         end
    end
  end
end
end
end

def big_shoe_rebounds
  max = nil
game_hash.each do |location, team_data|
  team_data.each do |attribute, info|
   if attribute == :players
     info.each do |players_name, stats|
       stats.each do |key_, value_|
         if max == nil || stats[:shoe] > max
           max = stats[:shoe]
          return rebounds_for_biggest_shoe = stats[:rebounds]
         end
       end
     end
    end
   end
 end
end





                    ######## Bonus Questions ###########

def most_points_scored
  max = nil
  player_for_most_points = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_name, stats|
      if max == nil || stats[:points] > max
         max = stats[:points]
         player_for_most_points = players_name
       #binding.pry
     end

     end
   end
  return player_for_most_points
end


def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |players_name, stats|
    home_points += stats[:points]
  end
  game_hash[:away][:players].each do |players_name, stats|
    away_points += stats[:points]
  end
  if home_points > away_points
  game_hash[:home][:team_name]
else
  game_hash[:away][:team_name]
end
end


def player_with_longest_name
  longest_name_player = nil
game_hash.each do |location, team_data|
  team_data[:players].each do |players_name, info|
     if longest_name_player == nil || players_name.length > longest_name_player.length
       longest_name_player = players_name
   end
  end
 end
 longest_name_player
end



def long_name_steals_a_ton?
most_steals = nil
player_for_most_steals = nil
game_hash.each do |location, team_data|
  team_data[:players].each do |players_name, stats|
       if most_steals == nil || stats[:steals] > most_steals
         most_steals = stats[:steals]
         player_for_most_steals = players_name
       end
  end
 end
 player_for_most_steals == player_with_longest_name
end
