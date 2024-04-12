# frozen_string_literal: true

require_relative "Ryze/version"

# The main module for the gem.
module Ryze
  autoload :Client, "Ryze/client"
  autoload :Error, "Ryze/error"
  autoload :Object, "Ryze/object"
  autoload :Resource, "Ryze/resource"

  autoload :Summoner, "Ryze/objects/summoner"
  autoload :Match, "Ryze/objects/match"
  autoload :Account, "Ryze/objects/account"
  autoload :League, "Ryze/objects/league"
  autoload :Spectator, "Ryze/objects/spectator"

  autoload :SummonerResource, "Ryze/resources/summoner"
  autoload :MatchResource, "Ryze/resources/match"
  autoload :AccountResource, "Ryze/resources/account"
  autoload :LeagueResource, "Ryze/resources/league"
  autoload :SpectatorResource, "Ryze/resources/spectator"
end
