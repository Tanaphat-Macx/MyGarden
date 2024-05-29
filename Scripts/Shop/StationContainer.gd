extends VBoxContainer

@export var seedExtractorScene: PackedScene
@export var VetgetableResource: VegetableResource
@export var seedResource: SeedResource

func _ready() -> void:
	assert(VetgetableResource.get_size() == seedResource.get_size())
	add_conversion_container()
	
func add_conversion_container():
	for child in VetgetableResource.get_vegetable_list():
		var seed = seedResource .get_seed_data(child.get_vegetable_name())
		if seed == null:
			return
		
		instance_conversion_scene(child, seed)
		
func instance_conversion_scene(value1, value2) -> void:
		var scene = seedExtractorScene.instantiate()
		add_child(scene)
		scene.initialize(value1, value2)
	  
