extends Node2D

@export_group("Required Nodes")
@export var Sprite: Sprite2D
@export var BarrelMarker: Marker2D
@export var BulletNode: Bullet

@export_group("Gun Properties")
@export var BulletSpeed: float
@export var BulletDamage: int
@export var ReloadTime: float
@export var AfterShotDelay: float
@export var BeforeShotDelay: float


func shoot():
	pass
