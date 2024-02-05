extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.has_method("axe_change"):
		body.axe_change()
		queue_free()
