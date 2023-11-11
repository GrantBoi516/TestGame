extends Area2D

@onready var sprite = get_parent().get_node("Sprite2D")
@onready var anim = sprite.get_node("AnimationPlayer")
func _ready():
	anim.play("spin")


func _on_body_entered(body: Node) -> void:
	if body.has_method("get_coin"):
		body.get_coin()
		get_parent().queue_free()
