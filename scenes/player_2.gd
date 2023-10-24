extends CharacterBody2D

@export var speed = 100
@export var gravite = 7
@export var jump= 107
var sentido = 1
var sentido2 = 1
var target_velocity = Vector2.ZERO
var direction = Vector2.ZERO
var velocidade= Vector2.ZERO
var salto = true
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	
	move_and_slide()

func get_input():
	animando("walk")
	if Input.is_action_pressed('ui_right'):
		velocity.x=speed
		sentido = 1
	elif Input.is_action_pressed('ui_left'):
		sentido = -1
		velocity.x=-speed
	if Input.is_action_just_pressed('ui_up') and salto:
		salto = false
		velocity.y=-jump
	else:
		if velocity.x > 0:
			velocity.x-=1
		elif velocity.x <0:
			velocity.x+=1
	velocity.y+= gravite
	if sentido != sentido2:
		sentido2 = sentido
		scale.x *= -1


func animando(animação_nome=""):
	$CollisionShape2D2/AnimatedSprite2D.play("walk")
	pass


func _on_area_2d_body_entered(body):
	salto = true
	pass # Replace with function body.
