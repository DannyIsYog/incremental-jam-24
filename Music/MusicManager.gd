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

var andar = 0

func _ready():
	#play fase 1
	audio_stream_player_2d.stream = fase1
	audio_stream_player_2d.play()
	pass

func _process(delta):
	
	if andar <= 8:
		audio_stream_player_2d.stream = fase1
	if  12 <= andar  && andar <= 20:
		audio_stream_player_2d.stream = fase2

func change_song_to(song):
	audio_stream_player_2d.stream = song

