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
	
	if andar <= 12:
		audio_stream_player_2d.stream = fase1
		audio_stream_player_2d.play() #talvez tenha colocar a linha 18 aqui
	if 12 < andar && andar <= 24:
		audio_stream_player_2d.stream = fase2
	if 24 < andar && andar <= 36:
		audio_stream_player_2d.stream = fase3
	if 36 < andar && andar <= 48:
		audio_stream_player_2d.stream = fase4
	if 48 < andar && andar <= 60:
		audio_stream_player_2d.stream = fase5
	if 60 < andar && andar <= 72:
		audio_stream_player_2d.stream = fase6
	if 72 < andar && andar <= 85:
		audio_stream_player_2d.stream = fase7
	if 85 < andar && andar <= 100:
		audio_stream_player_2d.stream = fase8
		
	pass

func change_song_to(song):
	audio_stream_player_2d.stream = song

