extends CharacterBody2D

@export var speed = 150
@export var gravite = 10
@export var jump= 300
@export var atric = 15
var sentido = 1
var sentido2 = 1
var target_velocity = Vector2.ZERO
var direction = Vector2.ZERO
var velocidade= Vector2.ZERO
var salto = true
var animação = "stop"
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	
	move_and_slide()

func get_input():
	if Input.is_action_pressed('ui_right'):
		animação = 'walk'
		velocity.x=speed
		sentido = 1
	elif Input.is_action_pressed('ui_left'):
		animação = 'walk'
		sentido = -1
		velocity.x=-speed
	else:
		animação = 'stop'
		if velocity.x != 0:
			if velocity.x > 0:
				velocity.x = velocity.x - atric
			else:
				velocity.x = velocity.x +  atric
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
	animando(animação)

func animando(animação_nome=""):
	$AnimatedSprite2D.play(animação_nome)
	pass


func _on_area_2d_body_entered(body):
	salto = true
	pass # Replace with function body.
	

func _on_hit_box_body_entered(body):
	if body != $".":
		get_tree().reload_current_scene()
	pass # Replace with function body.
