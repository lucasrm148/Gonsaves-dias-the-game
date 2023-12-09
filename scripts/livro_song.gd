extends Area2D
@export var paths = ""
var condicional= true
var is_played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = load(paths)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".rotation += 3*delta
	if $AudioStreamPlayer2D.playing == false and is_played:
		print('aqui')
		self.queue_free()
		pass
	pass

func _on_body_entered(body):
	if $"book_image":
		$"book_image".queue_free()
	if condicional:
		$AudioStreamPlayer2D.play()
		condicional = false
		is_played = true
	pass # Replace with function body.
