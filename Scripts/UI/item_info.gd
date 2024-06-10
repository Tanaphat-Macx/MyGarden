extends TextureRect

@onready var seed_bag: TextureRect = $MarginContainer/SeedBag
@onready var label: Label = $MarginContainer/SeedBag/Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Set Image and value 
#--> SlotContainer
func set_item_info(item_texture: Texture, value) -> void:
	seed_bag.texture = item_texture
	set_label(value)

# Set value 
#--> SlotContainer 
#--> set_item_info method
func set_label(value) -> void:
	label.text = str(value)

# Play Animation 
#--> SlotContainer
func play_flash_animation() -> void:
	animation_player.play("flash")
