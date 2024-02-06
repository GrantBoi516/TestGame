extends Control
var random = RandomNumberGenerator.new()
var x = 0
var ability
var willowisp= preload("res://Assets/Will-o-wisp.png")
var cynderingrage= preload("res://Assets/Cyndering-rage.png")
var burningtouch= preload("res://Assets/Burning-Touch (original i know).png")
var blastdamage= preload("res://Assets/Blast Damage.png")
var circleshock= preload("res://Assets/360 Shock.png")
var conductivity= preload("res://Assets/Conductivity.png")
var lightningswing= preload("res://Assets/Lightning swing thing.png")
var thunderclap= preload("res://Assets/Thunder-Clap.png")
var harden= preload("res://Assets/Harden.png")
var icespike= preload("res://Assets/Ice Spike.png")
var freeze= preload("res://Assets/Freeze.png")
var thinice= preload("res://Assets/Thin ice.png")
var ability_list1= [willowisp, cynderingrage, burningtouch, blastdamage]
var ability_list2= [circleshock, conductivity, lightningswing, thunderclap]
var ability_list3= [harden, icespike, freeze, thinice]
var list_of_list= [ability_list1, ability_list2, ability_list3]
@onready var player = get_parent().get_parent().get_node("CharacterBody2D")
@onready var option1 = $UpgradeSelect/HBoxContainer/Fire
@onready var option2 = $UpgradeSelect/HBoxContainer/Lightning
@onready var option3 = $UpgradeSelect/HBoxContainer/Ice
var actual_upgrades = []
func _ready():
	while x !=3:
		random.randomize()
		var random_ability = random.randi_range(0, 3)
		ability = list_of_list[x][random_ability]
		print(ability)
		actual_upgrades.append(ability)
		print(actual_upgrades)
		x += 1
	option1.set_button_icon(actual_upgrades[0])
	option2.set_button_icon(actual_upgrades[1])
	option3.set_button_icon(actual_upgrades[2])

func unlock_world():
	player.can_move = true
	player.get_node("hitbox").disabled = false
	player.get_node("Sprite2D").show()
	player.weapon.get_node("hitbox").disabled = false

func _on_fire_pressed():
	if actual_upgrades[0] == willowisp && player.active_abilitys.find("willowisp") == -1:
		player.active_abilitys.append("willowisp")
	elif actual_upgrades[0] == willowisp && player.active_abilitys.find("willowisp") > -1:
		player.willowisp_lvlup()
	if actual_upgrades[0] == cynderingrage && player.active_abilitys.find("cynderingrage") == -1:
		player.active_abilitys.append("cynderingrage")
		player.cynderingrage_lvlup()
	elif actual_upgrades[0] == cynderingrage && player.active_abilitys.find("cynderingrage") > -1:
		player.cynderingrage_lvlup()
	if actual_upgrades[0] == burningtouch && player.active_abilitys.find("burningtouch") == -1:
		player.active_abilitys.append("burningtouch")
	elif actual_upgrades[0] == burningtouch && player.active_abilitys.find("burningtouch") > -1:
		player.burningtouch_lvlup()
	if actual_upgrades[0] == blastdamage && player.active_abilitys.find("blastdamage") == -1:
		player.active_abilitys.append("blastdamage")
	elif actual_upgrades[0] == blastdamage && player.active_abilitys.find("blastdamage") > -1:
		player.blastdamage_lvlup()
	print(player.active_abilitys)
	queue_free()
	unlock_world()

func _on_lightning_pressed():
	if actual_upgrades[1] == circleshock && player.active_abilitys.find("circleshock") == -1:
		player.active_abilitys.append("conductivity")
	elif actual_upgrades[1] == circleshock && player.active_abilitys.find("circleshock") > -1:
		player.circleshock_lvlup()
	if actual_upgrades[1] == conductivity && player.active_abilitys.find("conductivity") == -1:
		player.active_abilitys.append("conductivity")
	elif actual_upgrades[1] == conductivity && player.active_abilitys.find("conductivity") > -1:
		player.conductivity_lvlup()
	if actual_upgrades[1] == lightningswing && player.active_abilitys.find("lightningswing") == -1:
		player.active_abilitys.append("lightningswing")
	elif actual_upgrades[1] == lightningswing && player.active_abilitys.find("lightningswing") > -1:
		player.lightningswing_lvlup()
	if actual_upgrades[1] == thunderclap && player.active_abilitys.find("thunderclap") == -1:
		player.active_abilitys.append("thunderclap")
	elif actual_upgrades[1] == thunderclap && player.active_abilitys.find("thunderclap") > -1:
		player.thunderclap_lvlup()
	print(player.active_abilitys)
	queue_free()
	unlock_world()

func _on_ice_pressed():
	if actual_upgrades[2] == harden && player.active_abilitys.find("harden") == -1:
		player.active_abilitys.append("harden")
	elif actual_upgrades[2] == harden && player.active_abilitys.find("harden") > -1:
		player.harden_lvlup()
	if actual_upgrades[2] == icespike && player.active_abilitys.find("icespike") == -1:
		player.active_abilitys.append("icespike")
	elif actual_upgrades[2] == icespike && player.active_abilitys.find("icespike") > -1:
		player.icespike_lvlup()
	if actual_upgrades[2] == freeze && player.active_abilitys.find("freeze") == -1:
		player.active_abilitys.append("freeze")
	elif actual_upgrades[2] == freeze && player.active_abilitys.find("freeze") > -1:
		player.freeze_lvlup()
	if actual_upgrades[2] == thinice && player.active_abilitys.find("thinice") == -1:
		player.active_abilitys.append("thinice")
	elif actual_upgrades[2] == thinice && player.active_abilitys.find("thinice") > -1:
		player.thinice_lvlup()
	print(player.active_abilitys)
	queue_free()
	unlock_world()
