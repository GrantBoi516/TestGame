extends Area2D
@onready var anim = $WeaponAnim
@export var damage := 2

func _ready():
	$Sprite2D.hide()

func _physics_process(_delta):
	look_at(get_global_mouse_position())#points sword towards mouse


func axe_attack():#attack method referenced in parent script
	anim.play("axeSwing")
	
func attack():
		axe_attack()



func _on_body_entered(body: Node) -> void:#detects when it collides with and enemy and deals damage
	if body.has_method("get_hit"):
		body.get_hit(damage)
