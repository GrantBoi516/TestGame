extends Area2D
@onready var skeleton = load("res://Enemies/wizardskeleton/wizardSkeleton.tscn")



func _on_body_entered(body: Node) -> void:
	if body.has_method("movement"):
		var instancedSkel = skeleton.instantiate()
		get_parent().add_child(instancedSkel)
		instancedSkel.position.x = position.x
		instancedSkel.position.y = position.y - 100
