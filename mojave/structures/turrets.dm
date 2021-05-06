/obj/machinery/porta_turret/ms13
	name = "turret"
	icon = 'mojave/icons/structure/turrets.dmi'
	icon_state = "turret_tripod"
	always_up = TRUE
	has_cover = FALSE
	turret_flags = TURRET_FLAG_SHOOT_ALL
	mode = TURRET_LETHAL
	use_power = NO_POWER_USE
	reqpower = 0
	shot_delay = 1.5
	installation = null
	lethal_projectile = /obj/projectile/bullet/ms13/a308/turret
	lethal_projectile_sound = 'mojave/sound/ms13weapons/arfire.ogg'

/obj/machinery/porta_turret/ms13/update_icon_state()
	return

/obj/machinery/porta_turret/ms13/setup(obj/item/gun/turret_gun)
	return

/obj/projectile/bullet/ms13/a556/turret // Normal bullets don't have damage, Shoutout hekzder.
	damage = 20
	armour_penetration = 10
	wound_bonus = 5
