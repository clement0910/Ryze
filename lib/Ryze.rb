# frozen_string_literal: true

require_relative "Ryze/version"

module Ryze
  autoload :Client, "Ryze/client"
  autoload :Error, "Ryze/error"
  autoload :Object, "Ryze/object"
  autoload :Resource, "Ryze/resource"

  autoload :Summoner, "Ryze/objects/summoner"
  autoload :Match, "Ryze/objects/match"

  autoload :SummonerResource, "Ryze/resources/summoner"
  autoload :MatchResource, "Ryze/resources/match"
end
