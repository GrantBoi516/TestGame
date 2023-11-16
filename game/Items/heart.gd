extends Area2D

func _on_body_entered(body: Node) -> void:#makes the player gain a heart
	if body.has_method("get_heart"):
		if body.HP != body.max_HP:
			body.get_heart()
			queue_free()
