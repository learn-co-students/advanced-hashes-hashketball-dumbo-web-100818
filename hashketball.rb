# Write your code here!
require "pry"

def game_hash
  games = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors =>["Black","White"] ,
    :players => {
      "Alan Anderson" =>{
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" =>{
         :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
         :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" =>{
         :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" =>{
         :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors =>["Turquoise","Purple"] ,
    :players => {
      "Jeff Adrien" =>{
         :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" =>{
         :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
         :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" =>{
         :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" =>{
         :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
   }
  }
end

def num_points_scored(given_name)
  points = 0 
  game_hash.each do |where, stats|
    stats.each do |info, info_stats|
    if info == :players 
     info_stats.each do |points,statistics|
       if points==given_name
        statistics.each do |player_stats, value|
          if player_stats == :points 
              return value
          end
    end
    end
   end
  end
  end
 
end
 
end

def shoe_size(given_name)
points = 0 
  game_hash.each do |where, stats|
    stats.each do |info, info_stats|
    if info == :players 
     info_stats.each do |points,statistics|
       if points==given_name
        statistics.each do |player_stats, value|
          if player_stats == :shoe 
              return value
          end
    end
    end
   end
  end
  end
 
end
end


def team_colors(given_name) 
  game_hash.each do |where, stats|
    stats.each do |field, value|
    if value == given_name 
       stats.each do |x, y|
        if x == :colors     
          return y 
        end
     end
    end
   end 
  end
end

def team_names 
  teams = []
  game_hash.each do |where, team_stats|
    
    team_stats.each do |each_team, value|
      if each_team == :team_name
        teams << value
      end
  end
 end
 teams
end

def player_numbers(given_name)
  player_nums = []
  
  game_hash.each do |where, team_stats|
    team_stats.each do |each_team,value|
     if value == given_name
       team_stats.each do |each_stat, each_value|
          if each_stat == :players
            each_value.each do |value_type,points_rec|
              points_rec.each do |value_needed,total_points|
               if value_needed == :number
                 player_nums << total_points
               end
            end
          end
        end    
     end
    end
  end
 end
 player_nums
end


def player_stats(given_name)
  game_hash.each do |location, value|
    value.each do |stat_type, player_stats|
      if stat_type == :players
        player_stats.each do |player_name, player_stats|
          if player_name == given_name
            return player_stats
        end
      end
    end
  end
 end
end

def big_shoe_rebounds
  biggest_shoe_size = 0 
  total_rebounds = 0 
  game_hash.each do |location, stats|
    stats.each do |stat_type, player_stat|
      if stat_type == :players 
        player_stat.each do |each_player, player_info|
          each_player_stats = player_stats(each_player)
            each_player_stats.each do |stat_needed, stat_value|
              if stat_needed == :shoe && stat_value > biggest_shoe_size
                biggest_shoe_size = stat_value
                 each_player_stats.each do |rebounds,total_rebound|
                   if rebounds == :rebounds
                     total_rebounds= total_rebound
                 end
              end
           end
         end
       end
     end
   end
 end
 total_rebounds
end


















