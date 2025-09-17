extends CharacterBody2D


const SPEED = 50.0

#@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	#get input direction
	var direction_x := Input.get_axis("left", "right")
	#movemenet 
	#if direction_x > 0:
		#animated_sprite.flip_h = false
	#elif direction_x < 0:
		#animated_sprite.flip_h = true 

	# play animation
	if direction_x == 0:
		animated_sprite.play("idle")
	if direction_x == 1.0:
		animated_sprite.play("run_right")
	elif direction_x == -1.0:
		animated_sprite.play("run_left")
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Y movement 	
		
	var direction_y := Input.get_axis("up", "down")
	# animation 
	#if direction_y == 0:
		#animated_sprite.play("default")
	#elif direction_y > 0:
		#animated_sprite.play("up")
	#else:
		#animated_sprite.play("down")		
	#
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	#print(direction_y)

	move_and_slide()
