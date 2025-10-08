extends Node

#The current mode of the game, which can be Story or Endless. This lets us save the level you're on between modes.
var currentGameMode = "Story"

#Core variables for tracking mode progress
var storyLevel = 0
var endlessLevel = 0
var storyCurrentLives = 3
var endlessCurrentLives = 3
var storyCompleted = false
var endlessBestLevel = 0

#var resetLevelOnWorld = true #switches to false if you have enough lives to not refresh the structure and keep same seed

#Trap modifiers that influence their spawn chance or damage. LOWER SPAWN RATE NUMBER MEANS HIGHER CHANCE TO SPAWN.
var trapWallSpawnRate = 10.0 #If 2.5 or below, guaranteed spawn
var trapSusSpawnRate = 10.0 #If 1.5 or below, guaranteed spawn
var trapEyeSpawnRate = 10.0 #If 2.5 or below, guaranteed spawn over sus wall trap

var trapSusDamage = 20.0
var trapEyeDamage = 5.0

#Dungeon size/room modifiers
var dungeonXTotalSize = 10
var dungeonPossibleRoomSpawns: Array = ["res://roomTypes/MonsterRoom.tscn"]

#Player modifiers that mess with their core values
var playerModHealth = 100.0
var playerModHealthDegen = 0.0
var playerModStamConsumption = 2.0
var playerModMaxStam = 100.0

#2D Player modifier that tinkers with their movement speed, especially important for later
var storyPlayerMovementSpeed = 50.0

#Enemy modifiers that make the wraith more dangerous. The below values are the baseline
var wraithModChaseSpeed = 5.0
var wraithModRoamSpeed = 2.0
var wraithModSearchSpeed = 5.0
var wraithModChaseDuration = 3.5
var wraithModSearchDuration = 10.0
