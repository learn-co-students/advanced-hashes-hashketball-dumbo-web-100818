def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

# def num_points_scored(name)
#   game_hash.collect do |team, info|
#     game_hash[team][:players].collect do |player, stats|
#       if name == player
#         return game_hash[team][:players][player][:points]
#       end
#     end
#   end
# end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def num_points_scored(name)
  players[name][:points]
end


# def shoe_size(name)
#   results = 0
#   game_hash.each do |team, info|
#     game_hash[team][:players].each do |player, stats|
#       if name == player
#         results = stats[:shoe]
#       end
#     end
#   end
#   results
# end

# def shoe_size(size)
#   players.fetch(size)[:shoe]
# end

def shoe_size(size)
  players[size][:shoe]
end


# def color
#   game_hash[:home].merge(game_hash[:away])
# end

# def team_colors(logo)
#   color.fetch(logo)[:colors].to_ary
#   binding.pry
# end

def team_colors(the_team_name)
  arr = []
  game_hash.collect do |team, team_info|
    team_info.collect do |team_details, team_facts|
      if team_facts == the_team_name
        arr << game_hash[team][:colors]
      end
    end
  end
  arr.flatten
end

def team_names
  game_hash.collect do |the_team_names, everything_else|
    game_hash[the_team_names][:team_name]
  end
end

# def player_numbers(teams_numbers)
#   #binding.pry
# end

# game_hash[:home][:players][:number].merge(game_hash[:away][:players][:number])

# game_hash.collect do |x, y|
#   game_hash[x].collect do |a, b|
#     game_hash[y][a]
#   end
# end


# game_hash[:home].merge(game_hash[:away])[:colors].split(",")

def player_numbers(teams_name)
  the_players_number = []
  game_hash.collect do |teams, team_info|
    game_hash[teams][:players].collect do |player_name, player_stats|
      if game_hash[teams][:team_name] == teams_name 
      the_players_number << game_hash[teams][:players][player_name][:number]
      end
    end
  end
  the_players_number
end

# def players
#   game_hash[:home][:players].merge(game_hash[:away][:players])
# end

# def player_stats(players_name)
#   players[players_name]
# end
 
 def player_stats(players_name)
  game_hash.collect do |teams, team_info|
    game_hash[teams][:players].collect do |the_players_name, the_players_stats|
    if the_players_name == players_name
     return game_hash[teams][:players][players_name]
      end
    end
  end
 end
 
def big_shoe_rebounds
  game_hash.collect do |teams, team_info|
    game_hash[teams][:players].collect do |players_name, players_stats|
    if game_hash[teams][:players][players_name][:shoe] >= game_hash[teams][:players][players_name][:shoe]
      return game_hash[teams][:players][players_name][:rebounds]
    end
  end
  end
end
 
def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.collect do |teams, team_info|
    game_hash[teams][:players].collect do |players_name, players_stats|
    if game_hash[teams][:players][players_name][:shoe] >= shoe_size
      shoe_size = game_hash[teams][:players][players_name][:shoe]
       rebounds = game_hash[teams][:players][players_name][:rebounds]
    end
   end
  end
  rebounds
end
 
 
def most_points_scored
  most_points = 0
  player_with_most_points = nil 
  game_hash.collect do |teams, team_info|
    game_hash[teams][:players].collect do |players_name, players_stats|
      if game_hash[teams][:players][players_name][:points] > most_points
        most_points = game_hash[teams][:players][players_name][:points]
         player_with_most_points = players_name
      end
    end
  end
  player_with_most_points
end

 


def winning_team
  home_team = 0
  away_team = 0
    game_hash.collect do |team, team_info|
      game_hash[team][:players].collect do |player_name, players_stats|
        if team == :home
          home_team += game_hash[team][:players][player_name][:points]
        elsif team == :away
          away_team += game_hash[team][:players][player_name][:points]
        end
      end
    end
    if home_team > away_team
      :home
    else 
      :away
    end
end


def player_with_longest_name
  name_length = 0
  longest_name = nil
  game_hash.collect do |teams, team_info|
    game_hash[teams][:players].collect do |x, y|
      if x.length > name_length
        name_length = x.length
        longest_name = x
      end
    end
  end
  longest_name
end



def long_name_steals_a_ton?
  number_of_steals = 0
  player_with_most_steals = nil
  players.collect do |players_name, players_stats|
    if players[players_name][:steals] > number_of_steals
      number_of_steals = players[players_name][:steals]
      player_with_most_steals = players_name
    end
  end
  if player_with_longest_name == player_with_most_steals
    true
  else false
  end
end

def player_by_number(num)
  players.find do |player, player_stats|
     num == players[player][:number]
  end.first
end
