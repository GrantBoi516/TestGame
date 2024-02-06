extends Area2D


func _ready():
	$Sprite2D/AnimationPlayer.play("spin")




func _on_body_entered(body: Node) -> void:
	if body.has_method("get_coin"):
		body.get_coin()
		queue_free()

