extends CharacterBody2D
var velocidade= 400
var salto = 30 
var move_teste =false
var direction = 1
var solo = false

@onready var texture :=$"AnimatedSprite"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		move(delta)

func move(delta):
	print("e")
	move_teste = false #testa se esta se movendo
	if Input.is_action_pressed("ui_right"):# detcta tecla
		position.x+= 10
		velocity.x -= velocidade #movimentar o personagem
		texture.play("default")# dar play em uma animação
		texture.scale.x = 1 #muda a direção da animação
		
		move_teste = true
	elif Input.is_action_pressed("ui_right"):
		print("play")
		velocity.x-= velocidade
		texture.play("default")
		texture.scale.x = -1
		move_teste = true
	elif Input.is_action_pressed("ui_up") and solo:#pulo
		salto = 30
		velocity.y+= velocidade
		texture.play("default")
		move_teste =true
		false
	else:
		texture.play("default")
		move_teste =true
		
	if !move_teste:# parado 
		texture.play("default")#para a animação quando parado
		
func _on_area_2d_body_entered(body):
	solo = true
	salto = 0 
	print('solo')
	pass # Replace with function body.

func _physics_process(delta):
	
	move_and_slide()
