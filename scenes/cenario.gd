extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_area_2d_audio_2_body_entered(body):
	$"AudioStreamPlayer2D/Area2D_audio 2/AudioStreamPlayer2D_1".play()
	pass # Replace with function body.


func _on_area_2d_audio_3_body_entered(body):
	$"AudioStreamPlayer2D/Area2D_audio 3/AudioStreamPlayer2D_3".play()
	pass # Replace with function body.


func _on_area_2d_audio_4_body_entered(body):
	$"AudioStreamPlayer2D/Area2D_audio 4/AudioStreamPlayer2D_3".play()
	pass # Replace with function body.
