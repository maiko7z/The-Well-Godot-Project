extends State
class_name CorpseEnemyState

@onready var _enemy2: CorpseEnemy = owner # owner is the root of our enemy scene (the CharacterBody3D node)


func enter(previous_state_name: String, data := {}) -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass
