extends Node3D

signal map_ready_to_generate


func _ready() -> void:
	#if GlobalVariables.currentGameMode == "Story":
		##I know this is an if else statement hellscape but we really want to custom tailor each story level and I'm lazy af
		#if GlobalVariables.storyLevel == 1: #No enemy spawn on this level
			#GlobalVariables.trapWallSpawnRate = 15.0
			#GlobalVariables.trapEyeSpawnRate = 15.0
			#GlobalVariables.trapSusSpawnRate = 15.0
			#GlobalVariables.dungeonXTotalSize = 4
			#GlobalVariables.dungeonPossibleRoomSpawns = ["SmallRoom_U","SmallDeadEnd","ExitRoom"]
		#elif GlobalVariables.storyLevel == 2:
			#GlobalVariables.trapWallSpawnRate = 12.0
			#GlobalVariables.trapEyeSpawnRate = 12.0
			#GlobalVariables.trapSusSpawnRate = 12.0
			#GlobalVariables.dungeonXTotalSize = 6
			#GlobalVariables.dungeonPossibleRoomSpawns = ["MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
			#GlobalVariables.wraithModChaseDuration = 2.5
			#GlobalVariables.wraithModChaseSpeed = 4.0
			#GlobalVariables.wraithModSearchSpeed = 3.5
			#GlobalVariables.wraithModSearchDuration = 5.0
		#elif GlobalVariables.storyLevel == 3:
			#GlobalVariables.trapWallSpawnRate = 10.0
			#GlobalVariables.trapEyeSpawnRate = 10.0
			#GlobalVariables.trapSusSpawnRate = 10.0
			#GlobalVariables.dungeonXTotalSize = 6
			#GlobalVariables.dungeonPossibleRoomSpawns = ["MonsterRoom","LargeRoom_Cramped","LargeRoom","ExitRoom"]
			#GlobalVariables.wraithModChaseDuration = 3.0
			#GlobalVariables.wraithModChaseSpeed = 4.5
			#GlobalVariables.wraithModSearchSpeed = 4.0
			#GlobalVariables.wraithModSearchDuration = 7.0
		#elif GlobalVariables.storyLevel == 4:
			#GlobalVariables.trapWallSpawnRate = 8.0
			#GlobalVariables.trapEyeSpawnRate = 15.0
			#GlobalVariables.trapSusSpawnRate = 8.0
			#GlobalVariables.dungeonXTotalSize = 8
			#GlobalVariables.dungeonPossibleRoomSpawns = ["SmallRoom_U","MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
			#GlobalVariables.wraithModChaseDuration = 3.5
			#GlobalVariables.wraithModChaseSpeed = 5.0
			#GlobalVariables.wraithModSearchSpeed = 4.5
			#GlobalVariables.wraithModSearchDuration = 9.0
		#elif GlobalVariables.storyLevel == 5:
			#GlobalVariables.trapWallSpawnRate = 8.0
			#GlobalVariables.trapEyeSpawnRate = 7.0
			#GlobalVariables.trapSusSpawnRate = 25.0
			#GlobalVariables.dungeonXTotalSize = 8
			#GlobalVariables.dungeonPossibleRoomSpawns = ["SmallRoom_U","MonsterRoom","SmallerRoom_Pillar","SmallDeadEnd","ExitRoom"]
			#GlobalVariables.wraithModChaseDuration = 3.5
			#GlobalVariables.wraithModChaseSpeed = 5.0
			#GlobalVariables.wraithModSearchSpeed = 5.0
			#GlobalVariables.wraithModSearchDuration = 10.0
		#elif GlobalVariables.storyLevel == 6:
			#GlobalVariables.trapWallSpawnRate = 6.0
			#GlobalVariables.trapEyeSpawnRate = 10.0
			#GlobalVariables.trapSusSpawnRate = 8.0
			#GlobalVariables.dungeonXTotalSize = 10
			#GlobalVariables.wraithModChaseDuration = 4.0
			#GlobalVariables.wraithModChaseSpeed = 5.0
			#GlobalVariables.wraithModSearchSpeed = 5.0
			#GlobalVariables.wraithModSearchDuration = 12.0
			#GlobalVariables.dungeonPossibleRoomSpawns = ["LargeRoom","SmallerRoom_Pillar","SmallRoom_U","MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
	#else:
		#if GlobalVariables.endlessLevel <= 1: #Base for endless levels
			#print("Baby level")
			#GlobalVariables.trapWallSpawnRate = 15.0
			#GlobalVariables.trapEyeSpawnRate = 15.0
			#GlobalVariables.trapSusSpawnRate = 15.0
			#GlobalVariables.dungeonXTotalSize = 4
			#GlobalVariables.wraithModChaseDuration = 3.0
			#GlobalVariables.wraithModChaseSpeed = 5.0
			#GlobalVariables.wraithModSearchSpeed = 4.0
			#GlobalVariables.wraithModSearchDuration = 6.0
			#GlobalVariables.dungeonPossibleRoomSpawns = ["LargeRoom_Cramped","LargeRoom","ExitRoom","MonsterRoom",]
		#elif GlobalVariables.endlessLevel > 1 and GlobalVariables.endlessLevel < 10:
			#if RandomNumberGenerator.new().randf_range(0,10) < 1: #10% chance to increase
				#GlobalVariables.trapWallSpawnRate -= 1.0
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.trapEyeSpawnRate -= 1.0
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.trapSusSpawnRate -= 1.0
			#if RandomNumberGenerator.new().randf_range(0,20) < 1:
				#GlobalVariables.dungeonXTotalSize += 2.0
				#if GlobalVariables.dungeonXTotalSize < 8 and GlobalVariables.dungeonXTotalSize >= 6:
					#GlobalVariables.dungeonPossibleRoomSpawns = ["LargeRoom","SmallerRoom_Pillar","MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
				#elif GlobalVariables.dungeonXTotalSize >= 8:
					#GlobalVariables.dungeonPossibleRoomSpawns = ["LargeRoom","SmallerRoom_Pillar","SmallRoom_U","MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModChaseDuration += 0.25
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModChaseSpeed += 0.25
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModSearchSpeed += 0.25
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModSearchDuration += 0.25
		#elif GlobalVariables.endlessLevel >= 10: #and GlobalVariables.endlessLevel < 20:
			#if RandomNumberGenerator.new().randf_range(0,8) < 1: #12.5% chance to increase
				#if GlobalVariables.trapWallSpawnRate > 1.0: #Do a check so that we don't dip into negatives and throw an error
					#GlobalVariables.trapWallSpawnRate -= 1.0
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#if GlobalVariables.trapEyeSpawnRate > 1.0:
					#GlobalVariables.trapEyeSpawnRate -= 1.0
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#if GlobalVariables.trapSusSpawnRate > 1.0:
					#GlobalVariables.trapSusSpawnRate -= 1.0
			#if RandomNumberGenerator.new().randf_range(0,17) < 1:
				#if GlobalVariables.dungeonXTotalSize < 20.0: #Don't get too big
					#GlobalVariables.dungeonXTotalSize += 2.0
				#if GlobalVariables.dungeonXTotalSize < 8 and GlobalVariables.dungeonXTotalSize >= 6:
					#GlobalVariables.dungeonPossibleRoomSpawns = ["LargeRoom","SmallerRoom_Pillar","MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
				#elif GlobalVariables.dungeonXTotalSize >= 8:
					#GlobalVariables.dungeonPossibleRoomSpawns = ["LargeRoom","SmallerRoom_Pillar","SmallRoom_U","MonsterRoom","LargeRoom_Cramped","SmallDeadEnd","ExitRoom"]
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModChaseDuration += 0.25
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModChaseSpeed += 0.25
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModSearchSpeed += 0.25
			#if RandomNumberGenerator.new().randf_range(0,10) < 1:
				#GlobalVariables.wraithModSearchDuration += 0.25
			#
	if GlobalVariables.currentGameMode == "Story":
		#I know this is an if else statement hellscape but we really want to custom tailor each story level and I'm lazy af
		if GlobalVariables.storyLevel == 1: #No enemy spawn on this level
			GlobalVariables.trapWallSpawnRate = 15.0
			GlobalVariables.trapEyeSpawnRate = 15.0
			GlobalVariables.trapSusSpawnRate = 15.0
			GlobalVariables.dungeonXTotalSize = 4
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/SmallRoom_U.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn"]
		elif GlobalVariables.storyLevel == 2:
			GlobalVariables.trapWallSpawnRate = 12.0
			GlobalVariables.trapEyeSpawnRate = 12.0
			GlobalVariables.trapSusSpawnRate = 12.0
			GlobalVariables.dungeonXTotalSize = 6
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn"]
			GlobalVariables.wraithModChaseDuration = 2.5
			GlobalVariables.wraithModChaseSpeed = 4.0
			GlobalVariables.wraithModSearchSpeed = 3.5
			GlobalVariables.wraithModSearchDuration = 5.0
		elif GlobalVariables.storyLevel == 3:
			GlobalVariables.trapWallSpawnRate = 10.0
			GlobalVariables.trapEyeSpawnRate = 10.0
			GlobalVariables.trapSusSpawnRate = 10.0
			GlobalVariables.dungeonXTotalSize = 6
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/LargeRoom.tscn","res://roomTypes/StraightHall.tscn","res://roomTypes/ExitRoom.tscn"]
			GlobalVariables.wraithModChaseDuration = 3.0
			GlobalVariables.wraithModChaseSpeed = 4.5
			GlobalVariables.wraithModSearchSpeed = 4.5
			GlobalVariables.wraithModSearchDuration = 7.0
		elif GlobalVariables.storyLevel == 4:
			GlobalVariables.trapWallSpawnRate = 8.0
			GlobalVariables.trapEyeSpawnRate = 15.0
			GlobalVariables.trapSusSpawnRate = 8.0
			GlobalVariables.dungeonXTotalSize = 8
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn"]
			GlobalVariables.wraithModChaseDuration = 3.5
			GlobalVariables.wraithModChaseSpeed = 5.0
			GlobalVariables.wraithModSearchSpeed = 5.0
			GlobalVariables.wraithModSearchDuration = 9.0
		elif GlobalVariables.storyLevel == 5:
			GlobalVariables.trapWallSpawnRate = 8.0
			GlobalVariables.trapEyeSpawnRate = 7.0
			GlobalVariables.trapSusSpawnRate = 25.0
			GlobalVariables.dungeonXTotalSize = 8
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/SmallerRoom_Pillar.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/StraightHall.tscn","res://roomTypes/ExitRoom.tscn"]
			GlobalVariables.wraithModChaseDuration = 3.5
			GlobalVariables.wraithModChaseSpeed = 5.0
			GlobalVariables.wraithModSearchSpeed = 5.5
			GlobalVariables.wraithModSearchDuration = 10.0
		elif GlobalVariables.storyLevel == 6:
			GlobalVariables.trapWallSpawnRate = 6.0
			GlobalVariables.trapEyeSpawnRate = 10.0
			GlobalVariables.trapSusSpawnRate = 8.0
			GlobalVariables.dungeonXTotalSize = 10
			GlobalVariables.wraithModChaseDuration = 4.0
			GlobalVariables.wraithModChaseSpeed = 5.0
			GlobalVariables.wraithModSearchSpeed = 6.0
			GlobalVariables.wraithModSearchDuration = 12.0
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom.tscn","res://roomTypes/SmallerRoom_Pillar.tscn","res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn"]
	else:
		if GlobalVariables.endlessLevel <= 1: #Base for endless levels
			GlobalVariables.trapWallSpawnRate = 15.0
			GlobalVariables.trapEyeSpawnRate = 15.0
			GlobalVariables.trapSusSpawnRate = 15.0
			GlobalVariables.dungeonXTotalSize = 4
			GlobalVariables.wraithModChaseDuration = 3.0
			GlobalVariables.wraithModChaseSpeed = 4.0
			GlobalVariables.wraithModSearchSpeed = 4.0
			GlobalVariables.wraithModSearchDuration = 6.0
			GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/LargeRoom.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/CorpseRoom.tscn","res://roomTypes/MonsterRoom.tscn"]
		elif GlobalVariables.endlessLevel > 1 and GlobalVariables.endlessLevel < 7:
			if RandomNumberGenerator.new().randf_range(0,10) < 1: #10% chance to increase
				GlobalVariables.trapWallSpawnRate -= 1.0
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.trapEyeSpawnRate -= 1.0
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.trapSusSpawnRate -= 1.0
			if RandomNumberGenerator.new().randf_range(0,20) < 1:
				GlobalVariables.dungeonXTotalSize += 2.0
				if GlobalVariables.dungeonXTotalSize < 8 and GlobalVariables.dungeonXTotalSize >= 6:
					GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom.tscn","res://roomTypes/SmallerRoom_Pillar.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn"]
				elif GlobalVariables.dungeonXTotalSize >= 8:
					GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom.tscn","res://roomTypes/SmallerRoom_Pillar.tscn","res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn",]
		
			#custom preset style dungeons have a chance to generate!
			#cramped style
			if RandomNumberGenerator.new().randf_range(0,9) < 1 and GlobalVariables.dungeonXTotalSize >= 8: #Cramped preset
				GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn","res://roomTypes/StraightHall_Multi.tscn"]
			elif RandomNumberGenerator.new().randf_range(0,8) < 1 and GlobalVariables.dungeonXTotalSize >= 10: #spacious style
				GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom_Multi.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn"]
			
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModChaseDuration += 0.25
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModChaseSpeed += 0.25
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModSearchSpeed += 0.25
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModSearchDuration += 0.25
		elif GlobalVariables.endlessLevel >= 7: #and GlobalVariables.endlessLevel < 20:
			if RandomNumberGenerator.new().randf_range(0,8) < 1: #12.5% chance to increase
				if GlobalVariables.trapWallSpawnRate > 1.0: #Do a check so that we don't dip into negatives and throw an error
					GlobalVariables.trapWallSpawnRate -= 1.0
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				if GlobalVariables.trapEyeSpawnRate > 1.0:
					GlobalVariables.trapEyeSpawnRate -= 1.0
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				if GlobalVariables.trapSusSpawnRate > 1.0:
					GlobalVariables.trapSusSpawnRate -= 1.0
			if RandomNumberGenerator.new().randf_range(0,17) < 1:
				
				if GlobalVariables.endlessLevel <= 12:
					if GlobalVariables.dungeonXTotalSize < 10.0: #Don't get too big
						GlobalVariables.dungeonXTotalSize += 2.0
				elif GlobalVariables.endlessLevel > 12 and GlobalVariables.endlessLevel <= 20:
					if GlobalVariables.dungeonXTotalSize < 15.0: #Don't get too big
						GlobalVariables.dungeonXTotalSize += 2.0
				elif GlobalVariables.endlessLevel > 20:
					if GlobalVariables.dungeonXTotalSize < 20.0: #Don't get too big
						GlobalVariables.dungeonXTotalSize += 2.0
				if GlobalVariables.dungeonXTotalSize < 8 and GlobalVariables.dungeonXTotalSize >= 6:
					GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom.tscn","res://roomTypes/SmallerRoom_Pillar.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn"]
				elif GlobalVariables.dungeonXTotalSize >= 8:
					GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom.tscn","res://roomTypes/SmallerRoom_Pillar.tscn","res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom_Cramped.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn",]
			
			#custom preset style dungeons have a chance to generate!
			#cramped style
			if RandomNumberGenerator.new().randf_range(0,8) < 1 and GlobalVariables.dungeonXTotalSize >= 8:
				GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/SmallRoom_U.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/SmallDeadEnd.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn","res://roomTypes/StraightHall_Multi.tscn"]
			elif RandomNumberGenerator.new().randf_range(0,8) < 1 and GlobalVariables.dungeonXTotalSize >= 10: #spacious style
				GlobalVariables.dungeonPossibleRoomSpawns = ["res://roomTypes/LargeRoom_Multi.tscn","res://roomTypes/MonsterRoom.tscn","res://roomTypes/LargeRoom.tscn","res://roomTypes/ExitRoom.tscn","res://roomTypes/StraightHall.tscn"]
			
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModChaseDuration += 0.25
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModChaseSpeed += 0.25
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModSearchSpeed += 0.25
			if RandomNumberGenerator.new().randf_range(0,10) < 1:
				GlobalVariables.wraithModSearchDuration += 0.25
			
	$DungeonGenerator3D.dungeon_size.x = GlobalVariables.dungeonXTotalSize
	print(str(GlobalVariables.dungeonPossibleRoomSpawns))
	map_ready_to_generate.emit()
	await get_tree().create_timer(3.0).timeout
	var enemy: Enemy = get_tree().get_first_node_in_group("enemy")
	if enemy:
		enemy.reached_player.connect(_enemy_reached_player)
	else:
		print("no enemy, no connection generated.")
		
	

func _enemy_reached_player() -> void:
	get_tree().change_scene_to_file("res://screens/jumpscare.tscn")
	
func player_reached_exit() -> void:
	get_tree().change_scene_to_file("res://screens/level_complete.tscn")
