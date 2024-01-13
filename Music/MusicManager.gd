extends Node2D

@export var fase1 : AudioStreamWAV
@export var fase2 : AudioStreamWAV
@export var fase3 : AudioStreamWAV
@export var fase4 : AudioStreamWAV
@export var fase5 : AudioStreamWAV
@export var fase6 : AudioStreamWAV
@export var fase7 : AudioStreamWAV
@export var fase8 : AudioStreamWAV
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _ready():
	#play fase 1
	audio_stream_player_2d.play(fase1)
	pass

func _process(delta):
	#calculos para decidir mudança da música
	pass
