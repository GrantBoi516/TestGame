extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.has_method("bow_change"):
		body.bow_change()
		queue_free()
