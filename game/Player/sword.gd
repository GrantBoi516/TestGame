extends Area2D
@onready var anim = $WeaponAnim
@export var damage := 1



func _physics_process(_delta):
	if not anim.is_playing():
		look_at(get_global_mouse_position())


func sword_attack():
	anim.play("swordSwing")
	
func attack():
		sword_attack()



func _on_body_entered(body: Node) -> void:
	if body.has_method("get_hit"):
		body.get_hit(damage)
