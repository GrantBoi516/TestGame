extends Area2D
@onready var anim = $WeaponAnim
@export var damage := 2

func _ready():
	$Sprite2D.hide()

func _physics_process(_delta):
	if not anim.is_playing():
		look_at(get_global_mouse_position())


func axe_attack():
	anim.play("axeSwing")
	
func attack():
		axe_attack()



func _on_body_entered(body: Node) -> void:
	if body.has_method("get_hit"):
		body.get_hit(damage)
