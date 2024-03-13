extends CharacterBody2D
class_name Bunny

@export var speed = 300
@export var gravity = 30

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = speed * horizontal_direction
	
	move_and_slide()
	
	print(velocity)

