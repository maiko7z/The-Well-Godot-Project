extends Node

#The current mode of the game, which can be Story or Endless. This lets us save the level you're on between modes.
var currentGameMode = "Story"

#Core variables for tracking mode progress
var storyLevel = 0
var endlessLevel = 0
var storyCurrentLives = 3
var endlessCurrentLives = 3
#var resetLevelOnWorld = true #switches to false if you have enough lives to not refresh the structure and keep same seed

#Trap modifiers that influence their spawn chance or damage
var trapSusSpawnRate = 0
var trapEyeSpawnRate = 0
var trapSusDamageBoost = 0
var trapEyeDamageBoost = 0

#Player modifiers that mess with their core values
var playerModHealth = 0
var playerModHealthDegen = 0
var playerModStam = 0
var playerModMaxStam = 0

#Enemy modifiers that make the wraith more dangerous
var wraithModChaseSpeed = 0
var wraithModRoamSpeed = 0
var wraithModSearchSpeed = 0
var wraithModChaseDuration = 0
var wraithModSearchDuration = 0
