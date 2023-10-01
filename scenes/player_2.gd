extends CharacterBody2D

@export var speed = 100
@export var gravite = 7
@export var jump= 107
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
	#var input_direction = Input.get_vector("ui_left","ui_right","ui_up",'ui_down')
	if Input.is_action_pressed('ui_right'):
		velocity.x=speed
		scale.x = 0.6
	elif Input.is_action_pressed('ui_left'):
		scale.x = -0.6
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
	



func animando(animação_nome=""):
	$AnimatedSprite2D.play(animação_nome)
	pass


func _on_area_2d_body_entered(body):
	salto = true
	pass # Replace with function body.
