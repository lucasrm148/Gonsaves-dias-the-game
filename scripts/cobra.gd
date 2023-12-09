extends CharacterBody2D

@export var speed = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func  _init():
	
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity = set_direction()
	move_and_slide()

func set_direction():
	
	var deslocamento  = Vector2.ZERO
	
	if $".".scale.x > 0:
		deslocamento.x = speed 
	if $".".scale.x < 0:
		deslocamento.x = -speed 
		pass
	if 	$".".scale.y >= 0:
		deslocamento.y = speed
	else:
		deslocamento.y = -speed
		
	return deslocamento


func _on_visible_on_screen_notifier_2d_screen_exited():
	$'.'.queue_free()
	pass # Replace with function body.
