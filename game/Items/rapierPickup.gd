extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.has_method("rapier_change"):
		body.rapier_change()
		queue_free()
