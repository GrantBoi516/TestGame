extends "res://Player/weapon.gd"
@onready var enviro = get_parent().get_parent()
@onready var anim = $WeaponAnim
@export var damage := 1
@onready var arrow = load("res://Player/arrow.tscn")
func _physics_process(_delta):
	if not anim.is_playing():
		look_at(get_global_mouse_position())


func crossbow_attack():
	anim.play("shot")
	
func spawn_arrow():
	var instancedArrow = arrow.instantiate()
	get_tree().current_scene.add_child.call_deferred(instancedArrow)
	instancedArrow.position = player.position
	var direction = player.global_position.direction_to(get_global_mouse_position())
	instancedArrow.rotation = direction.angle()


func attack():
		crossbow_attack()


