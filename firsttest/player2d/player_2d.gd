extends CharacterBody2D




#@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstepSound: AudioStreamPlayer = $StepSound
var prevStep := Vector2.ZERO

func _ready():
	prevStep = Vector2(global_position.x,global_position.y)

func _physics_process(delta):
	# Add the gravity.
	var SPEED = GlobalVariables.storyPlayerMovementSpeed
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	#get input direction
	var direction := Vector2( 
		Input.get_axis("left", "right"), 
		Input.get_axis("up","down")).normalized()
		
	#Update flip based on horizontal direction
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true 
	
	#Set velocity:
	velocity.x = move_toward(velocity.x, direction.x * SPEED, SPEED)
	velocity.y = move_toward(velocity.y, direction.y * SPEED, SPEED)	

	# Decide which animation plays 
	if direction == Vector2.ZERO:
		animated_sprite.play("Idle") #idle
	elif abs(direction.x) > abs(direction.y):
		animated_sprite.play("move_right")	
	else: 
		if direction.y < 0:
			animated_sprite.play("move_up")	
		else:
			animated_sprite.play("move_down")	
	
	#Footstep sounds
	var xy_position := Vector2(global_position.x, global_position.y)
	if prevStep.distance_to(xy_position) > 3:
		prevStep = xy_position
		if not footstepSound.playing:
			footstepSound.play()
		

# move and Slide
	move_and_slide()
