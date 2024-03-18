extends CharacterBody2D
class_name Enemy

var speed = -60
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if $RayCast2D.is_colliding() && is_on_floor():
		flip()
	
	if $RayCast2D2.is_colliding() && is_on_floor():
		flip()
	
	velocity.x = speed
	move_and_slide()
	
func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1


func _on_area_2d_area_entered(area):
	if area.get_parent() is Bunny:
		area.get_parent().queue_free()
