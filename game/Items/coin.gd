extends Area2D


func _ready():
	$Sprite2D/AnimationPlayer.play("spin")#makes coin spin




func _on_body_entered(body: Node) -> void:#makes the player gain a coin
	if body.has_method("get_coin"):
		body.get_coin()
		queue_free()

