extends Node2D
func _ready():
	$Sprite2D/AnimationPlayer.play("default")


func _on_area_2d_body_entered(_body):
	$Sprite2D/AnimationPlayer.play("open")


func _on_area_2d_body_exited(_body):
	$Sprite2D/AnimationPlayer.play("default")
