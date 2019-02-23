require "pry"

def game_hash
  {home:
    {team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
              "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
              "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
              "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
              "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
             }
    },
  away: {team_name: "Charlotte Hornets",
         colors: ["Turquoise", "Purple"],
         players: {"Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
                   "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
                   "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
                   "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
                   "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
                  }
        }
  }

end

def num_points_scored(players_name)
  if players_name != nil && game_hash[:home][:players].has_key?(players_name)
     game_hash[:home][:players][players_name][:points]

  elsif players_name != nil && game_hash[:away][:players].has_key?(players_name)
     game_hash[:away][:players][players_name][:points]
   end
end

def shoe_size(players_name)
  if players_name != nil && game_hash[:home][:players].has_key?(players_name)
     game_hash[:home][:players][players_name][:shoe]

  elsif players_name != nil && game_hash[:away][:players].has_key?(players_name)
     game_hash[:away][:players][players_name][:shoe]
   end
end

def team_colors(name_of_team)
  if name_of_team == game_hash[:home][:team_name]
     game_hash[:home][:colors]

  elsif  name_of_team == game_hash[:away][:team_name]
     game_hash[:away][:colors]
   end
end

def team_names
#Build a method, team_names, that operates on the game hash to return an array of the team names.
  team_name_array = []
  team_name_array << game_hash[:home][:team_name]
  team_name_array << game_hash[:away][:team_name]
  team_name_array
end

def player_numbers(name_of_team)
#Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.
  number_array = []
  team = {}
  if name_of_team == game_hash[:home][:team_name]
    team = game_hash[:home]
  elsif  name_of_team == game_hash[:away][:team_name]
     team = game_hash[:away]
  end

  team[:players].each do |name, player_info|
    jersey_number = player_info[:number]
    number_array << jersey_number
  end
  return number_array
end

def player_stats(player_stats)
  if game_hash[:home][:players].has_key?(player_stats)
    game_hash[:home][:players][player_stats]
  elsif game_hash[:away][:players].has_key?(player_stats)
    game_hash[:away][:players][player_stats]
  end
end

def big_shoe_rebounds
#Build a method, big_shoe_rebounds, that will return the number of rebounds
#associated with the player that has the largest shoe size.
largest_home_shoe = 0
home_player = nil
largest_away_shoe = 0
away_player = nil
  game_hash[:home][:players].each do |name, info_hash|
    if  largest_home_shoe == 0 || largest_home_shoe < info_hash[:shoe]
      largest_home_shoe = info_hash[:shoe]
      home_player = name
    end
  end
  game_hash[:away][:players].each do |name, info_hash|
    if  largest_away_shoe == 0 || largest_away_shoe < info_hash[:shoe]
      largest_away_shoe = info_hash[:shoe]
      away_player = name
    end
  end
  if largest_home_shoe > largest_away_shoe
    return game_hash[:home][:players][home_player][:rebounds]
  else
    return game_hash[:away][:players][away_player][:rebounds]
  end
end
