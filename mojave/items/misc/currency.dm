/obj/item/stack/ms13
	name = "Non-Existant item stack"
	desc = "The Universe is falling down. Falling down. Falling down. Phone. A. Dev. This is just so that there's not an undefined parent. Replace it when relevant."
	icon = 'mojave/icons/mob/skinning.dmi'
	icon_state = "honeybeast_hide"
	throwforce = 100000

/obj/item/stack/ms13/currency
	name = "bottle cap"
	singular_name = "cap"
	icon = 'mojave/icons/objects/economy.dmi'
	icon_state = "bottle_cap"
	amount = 1
	max_amount = 2000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/flavor_desc = ""
	var/value = CASH_CAP

/obj/item/stack/ms13/currency/Initialize()
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/ms13/currency/proc/update_desc()
	desc = "It's worth [amount] [singular_name][ (latin) ? (( amount > 1 ) ? "i" : "us") : (( amount > 1 ) ? "s" : "")].\n[flavor_desc]"

/obj/item/stack/ms13/currency/merge(obj/item/stack/S)
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/ms13/currency/use(used, transfer = FALSE)
	. = ..()
	update_desc()
	update_icon()

/obj/item/stack/ms13/currency/random
	var/money_type = /obj/item/stack/ms13/currency
	var/min_qty = LOW_MIN
	var/max_qty = LOW_MAX

/obj/item/stack/ms13/currency/random/Initialize()
	..()
	spawn_money()
	return INITIALIZE_HINT_QDEL

/obj/item/stack/ms13/currency/random/proc/spawn_money()
	var/obj/item/stack/ms13/currency/stack = new money_type
	stack.loc = loc
	stack.amount = round(rand(min_qty, max_qty))
	stack.update_icon()

/* we have 6 icons, so we will use our own, instead of stack's   */
/obj/item/stack/ms13/currency/update_icon()
	switch(amount)
		if(1)
			icon_state = "[initial(icon_state)]"
		if(2 to 5)
			icon_state = "[initial(icon_state)]2"
		if(6 to 50)
			icon_state = "[initial(icon_state)]3"
		if(51 to 100)
			icon_state = "[initial(icon_state)]4"
		if(101 to 500)
			icon_state = "[initial(icon_state)]5"
		if(501 to max_amount)
			icon_state = "[initial(icon_state)]6"


/* same as base, just classed for merging reasons */
/obj/item/stack/ms13/currency/bottle_cap
	flavor_desc = "A standard Nuka-Cola bottle cap featuring 21 crimps and ridges,\n\
		A common unit of exchange, backed by water in the Hub"

/obj/item/stack/ms13/currency/random/bottle_cap
	money_type = /obj/item/stack/ms13/currency/bottle_cap

/obj/item/stack/ms13/currency/random/bottle_cap/low
	min_qty = LOW_MIN / CASH_CAP
	max_qty = LOW_MAX / CASH_CAP

/obj/item/stack/ms13/currency/random/bottle_cap/med
	min_qty = MED_MIN / CASH_CAP
	max_qty = MED_MAX / CASH_CAP

/obj/item/stack/ms13/currency/random/bottle_cap/high
	min_qty = HIGH_MIN / CASH_CAP
	max_qty = HIGH_MAX / CASH_CAP

/obj/item/stack/ms13/currency/denarius
	name = "Denarius"
	latin = 1
	singular_name = "Denari" // -us or -i
	icon_state = "denarius"
	flavor_desc =	"The inscriptions are in Latin,\n\
		'Caesar Dictator' on the front and\n\
		'Magnum Chasma' on the back."
	value = CASH_DEN * CASH_CAP

/obj/item/stack/ms13/currency/random/denarius
	money_type = /obj/item/stack/ms13/currency/denarius

/obj/item/stack/ms13/currency/random/denarius/low
	min_qty = LOW_MIN / CASH_DEN
	max_qty = LOW_MAX / CASH_DEN

/obj/item/stack/ms13/currency/random/denarius/med
	min_qty = MED_MIN / CASH_DEN
	max_qty = MED_MAX / CASH_DEN

/obj/item/stack/ms13/currency/random/denarius/high
	min_qty = HIGH_MIN / CASH_DEN
	max_qty = HIGH_MAX / CASH_DEN

/obj/item/stack/ms13/currency/random/denarius/legionpay_basic
	min_qty = LOW_MIN / CASH_DEN
	max_qty = LOW_MAX / CASH_DEN

/obj/item/stack/ms13/currency/random/denarius/legionpay_veteran
	min_qty = MED_MIN / CASH_DEN
	max_qty = MED_MAX / CASH_DEN

/obj/item/stack/ms13/currency/random/denarius/legionpay_officer
	min_qty = HIGH_MIN / CASH_DEN
	max_qty = HIGH_MAX / CASH_DEN

/obj/item/stack/ms13/currency/aureus
	name = "Aureus"
	latin = 1
	singular_name = "Aure"// -us or -i
	icon_state = "aureus"
	flavor_desc = 	"The inscriptions are in Latin,\n\
					'Aeternit Imperi' on the front and\n\
					'Pax Per Bellum' on the back."
	value = CASH_AUR * CASH_CAP

/obj/item/stack/ms13/currency/random/aureus
	money_type = /obj/item/stack/ms13/currency/aureus

/obj/item/stack/ms13/currency/random/aureus/low
	min_qty = 1
	max_qty = 1

/obj/item/stack/ms13/currency/random/aureus/med
	min_qty = 2
	max_qty = 2

/obj/item/stack/ms13/currency/random/aureus/high
	min_qty = 2
	max_qty = 5 //uses flat values because aurei are worth so much

/obj/item/stack/ms13/currency/ncr
	name = "NCR Dollar"
	singular_name = "NCR Dollar"  /* same for denarius, we can pretend the legion can't latin properly */
	icon_state = "ncr" /* 10 points to whoever writes flavour text for each bill */
	value = CASH_NCR * CASH_CAP

/obj/item/stack/ms13/currency/ncr/update_icon()
	switch(amount)
		if(1 to 9)
			icon_state = "[initial(icon_state)]"
		if(10 to 19)
			icon_state = "[initial(icon_state)]10"
		if(20 to 49)
			icon_state = "[initial(icon_state)]20"
		if(50 to 99)
			icon_state = "[initial(icon_state)]50"
		if(100 to 199)
			icon_state = "[initial(icon_state)]100"
		if(200 to 499)
			icon_state = "[initial(icon_state)]200"
		if(500 to max_amount)
			icon_state = "[initial(icon_state)]500"

/obj/item/stack/ms13/currency/random/ncr
	money_type = /obj/item/stack/ms13/currency/ncr

/obj/item/stack/ms13/currency/random/ncr/low
	min_qty = LOW_MIN / CASH_NCR
	max_qty = LOW_MAX / CASH_NCR

/obj/item/stack/ms13/currency/random/ncr/med
	min_qty = MED_MIN / CASH_NCR
	max_qty = MED_MAX / CASH_NCR

/obj/item/stack/ms13/currency/random/ncr/high
	min_qty = HIGH_MIN / CASH_NCR
	max_qty = HIGH_MAX / CASH_NCR

/obj/item/stack/ms13/currency/random/ncr/ncrpay_basic
	min_qty = LOW_MIN / CASH_NCR
	max_qty = LOW_MAX / CASH_NCR

/obj/item/stack/ms13/currency/random/ncr/ncrpay_veteran
	min_qty = MED_MIN / CASH_NCR
	max_qty = MED_MAX / CASH_NCR

/obj/item/stack/ms13/currency/random/ncr/ncrpay_officer
	min_qty = HIGH_MIN / CASH_NCR
	max_qty = HIGH_MAX / CASH_NCR
