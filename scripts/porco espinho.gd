extends CharacterBody2D
@export var velocidade =3
@export var distancia_x = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _init():
	pass

func _physics_process(delta):
	velocity.x += velocidade
	ver()
	move_and_slide()
	
func ver():
	if ! $"RayCast2D".is_colliding():
		$".".scale.x = $".".scale.x * -1 
		velocidade = velocidade * -1
		velocity.x = 0 
	elif $"visão_aly+parede".is_colliding():
		$".".scale.x = $".".scale.x * -1 
		velocidade = velocidade * -1
		velocity.x = 0 
	pass
