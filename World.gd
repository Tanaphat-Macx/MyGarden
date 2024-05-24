extends Node2D

const MINUTES_PER_DAY = 1440
const MINITES_PER_HOUR = 60
const INGAME_TO_REAL_MINUTE_DURATION = (2 * PI) / MINUTES_PER_DAY

@onready var daylight: CanvasModulate = %Daylight
@onready var waterlight: CanvasModulate = %Water

@onready var day_time_label: Control = $HUD/DayTimeLabel
@export var gradient: GradientTexture1D

@export var INGAME_SPEED = 1.0
@export var INITIAL_HOUR = 12:
	set(h):
		INITIAL_HOUR = h
		time = INGAME_TO_REAL_MINUTE_DURATION * INITIAL_HOUR * MINITES_PER_HOUR

signal time_tick(day:int, hour:int, minute:int)

var time:float = 0.0
var past_minute:float = -1.0


func _ready() -> void:
	#DayTime
	daylight.visible = true
	waterlight.visible = true

	time = INGAME_TO_REAL_MINUTE_DURATION * INITIAL_HOUR * MINITES_PER_HOUR
	time_tick.connect(day_time_label.set_daytime)

func _process(delta: float) -> void:
	#DayTime
	time += delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED
	var value = (sin(time - PI / 2 ) + 1.0) / 2.0
	daylight.color = gradient.gradient.sample(value)
	waterlight.color = gradient.gradient.sample(value)
	
	_reacalculate_time()
	
func _reacalculate_time() -> void:
	#For show on UI and Runtime
	var total_miniutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)
	
	var day = int(total_miniutes / MINUTES_PER_DAY)
	
	var current_day_minutes = total_miniutes % MINUTES_PER_DAY
	
	var hour = int(current_day_minutes / MINITES_PER_HOUR)
	var minute = int(current_day_minutes % MINITES_PER_HOUR)
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)
	


	
