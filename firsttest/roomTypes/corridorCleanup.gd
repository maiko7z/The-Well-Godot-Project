@tool
extends DungeonRoom3D
## Called when the node enters the scene tree for the first time.
#signal finished_generating

func _ready():
	#$"..".connect("dungeon_done_generating",remove_used_doors)
	super._ready()
	dungeon_done_generating.connect(remove_used_doors)
	

	#dungeon_done_generating.connect(remove_used_doors)
	#"DungeonGenerator3D/RoomsContainer/LargeRoom_1"
func remove_used_doors():
	await get_tree().create_timer(1.0).timeout
	#print("attempting to remove doors")
	#if get_door_by_node($"../GridMap/DOOR?_LEFT").get_room_leads_to() != null: $"../GridMap/DOOR?_LEFT".queue_free(); print("destroying door left")
	#if get_door_by_node($"../GridMap/DOOR?_RIGHT").get_room_leads_to() != null: $"../GridMap/DOOR?_RIGHT".queue_free(); print("destroying door right")
	#if get_door_by_node($"../GridMap/DOOR?_FRONT").get_room_leads_to() != null: $"../GridMap/DOOR?_FRONT".queue_free(); print("destroying door front")
	#if get_door_by_node($"../GridMap/DOOR?_BACK").get_room_leads_to() != null: $"../GridMap/DOOR?_BACK".queue_free(); print("destroying door back")
	for door in get_doors():
		if door.get_room_leads_to() != null and door.door_node != null:
			door.door_node.queue_free()
	#if $NavigationRegion3D/GridMap/TrapSpots:
		#print("it's a trap!")
