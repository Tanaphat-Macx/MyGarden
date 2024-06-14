extends CanvasLayer

@onready var vet_shop: Control = $VetShop
@onready var tool_bar: PanelContainer = $bottom_bar/tool_bar
@onready var inventory: PanelContainer = $bottom_bar/Inventory

@onready var screenSize = get_viewport().get_visible_rect().size
@onready var testScreen= get_viewport().get_visible_rect()
@onready var bottom_bar: Control = $bottom_bar

var bottomBar_hidden: bool = false
var tool_bar_pos = Vector2(500, 550)
var inventory_pos = Vector2(295, 630)


func _ready() -> void:
	print("ตำแหน่ง bar:", bottom_bar.position)
	print(" bar:", bottom_bar.size)
	
	
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_inventory"): #and not vet_shop.visible:
		bottomBar_hidden = not bottomBar_hidden
		toggle_inventory_ui()
		
		
func toggle_inventory_ui() -> void:
	create_tween().set_ease(Tween.EASE_IN_OUT).tween_property(
		bottom_bar, "position", Vector2(bottom_bar.position.x, bottom_bar.position.y + 160) #screenSize.y + inventory.size.y 
		if bottomBar_hidden 
		else Vector2(bottom_bar.position.x, bottom_bar.position.y - 160), #screenSize.y - inventory.size.y, 
		1.0)
	#create_tween().set_ease(Tween.EASE_IN_OUT).tween_property(
		#tool_bar, "position", Vector2(tool_bar.position.x, 776) 
		#if bottomBar_hidden 
		#else  tool_bar_pos, 
		#0.6)
	#create_tween().set_ease(Tween.EASE_IN_OUT).tween_property(
		#inventory, "position", Vector2(inventory.position.x, 776) 
		#if bottomBar_hidden 
		#else  inventory_pos, 
		#0.6)
	print("\n")		
	print("It's Work")
	print("ขนาดสี่เหลี่ยมที่มองเห็น:", testScreen.size)
	#print("ขนาดสี่เหลี่ยม bar:", tool_bar.size)
	print("ตำแหน่ง bar:", bottom_bar.position)
	#print("ตำแหน่ง bar:", tool_bar_pos)
	
	
