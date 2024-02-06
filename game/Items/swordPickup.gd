extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.has_method("sword_change"):
		body.sword_change()
		queue_free()
