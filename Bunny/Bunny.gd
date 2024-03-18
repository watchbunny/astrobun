extends CharacterBody2D
class_name Bunny

@export var speed = 200
@export var jump_height = -400

@onready var bunny = $"."

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
		
	var horizontal_direction = Input.get_axis("left", "right")
	if horizontal_direction:
		velocity.x = speed * horizontal_direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	#if horizontal_direction>0:
		#bunny.flip_h=false
		#RayCast2D.scale.x=-.5
		#
	#elif horizontal_direction<0:
		#bunny.flip_h=true
		#RayCast2D.scale.x=.5
		
		
		
	move_and_slide()
	
	

