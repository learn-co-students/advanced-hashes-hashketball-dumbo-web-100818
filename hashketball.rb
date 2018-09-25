# Write your code here!
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
        assists:12,
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

def num_points_scored(player)
  points = 0
  both = game_hash[:away][:players].merge(game_hash[:home][:players])
  points = both[player][:points]
end

def shoe_size(player)
  points = 0
  away = game_hash[:away][:players]
  home = game_hash[:home][:players]
if away.include?(player)
  points = away[player][:shoe]
elsif home.include?(player)
  points = home[player][:shoe]
end
points
end

def team_colors(team)

  away = game_hash[:away]
  home = game_hash[:home]
if team == away[:team_name]
  away[:colors]
elsif team == home[:team_name]
  home[:colors]
end
end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
end

def player_numbers(team)
  numbers = []
  away = game_hash[:away]
  home = game_hash[:home]
if team == away[:team_name]
  away[:players].each do |k, v|
  numbers << v[:number]
  end
elsif team == home[:team_name]
  home[:players].each do |k, v|
    numbers << v[:number]
  end
end
numbers
end

def player_stats(player)
  away = game_hash[:away][:players]
  home = game_hash[:home][:players]
if away.include?(player)
  away[player]
elsif home.include?(player)
  home[player]
end
end

def big_shoe_rebounds
  rebound = 0
  shoe = 0
  both = game_hash[:away][:players].merge(game_hash[:home][:players])

  both.each do |k,v|
    if v[:shoe] > shoe
      shoe = v[:shoe]
      rebound = v[:rebounds]
    end
  end
  rebound
end

def most_points_scored
  name = ""
  points = 0
  both = game_hash[:away][:players].merge(game_hash[:home][:players])

  both.each do |k,v|
    if v[:points] > points
      points = v[:points]
      name = k
    end
  end
  name
end

def winning_team
  team = ""
  pointsh = 0
  pointsa = 0
  away = game_hash[:away][:players]
  home = game_hash[:home][:players]

  home.each do |k, v|
    pointsh += v[:points]
  end
  away.each do |k, v|
    pointsa += v[:points]
  end

  if pointsh > pointsa
    team = game_hash[:home][:team_name]
  elsif pointsa > pointsh
    team = game_hash[:away][:team_name]
end
end

def player_with_longest_name
  name = ""
  both = game_hash[:away][:players].merge(game_hash[:home][:players])

  both.each do |k,v|
    if k.length > name.length
      name = k
    end
  end
  name
end

def long_name_steals_a_ton?
  name = ""
  steals = 0
  both = game_hash[:away][:players].merge(game_hash[:home][:players])

  both.each do |k,v|
    if v[:steals] > steals
      steals = v[:steals]
      name = k
    end
  end

  if name == player_with_longest_name
    true
  else
    false
  end
end
