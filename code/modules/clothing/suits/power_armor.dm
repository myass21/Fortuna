
/* Temp commented out due to clash with old system

//Power armors, including salvaged and faction

/obj/item/clothing/suit/armor/f13/power_armor
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 0.4 //+0.1 from helmet = total 0.5
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEJUMPSUIT
	item_flags = SLOWS_WHILE_IN_HAND
	clothing_flags = THICKMATERIAL
	equip_delay_self = 50
	equip_delay_other = 60
	strip_delay = 200
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	repair_kit = /obj/item/repair_kit/pa
	protected_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	var/deflection_chance = 0 //Chance for the power armor to redirect a blocked projectile
	var/armor_block_threshold = 0.3 //projectiles below this will deflect
	var/melee_block_threshold = 30
	var/dmg_block_threshold = 42
	var/powerLevel = 7000
	var/powerMode = 3
	var/emped = 0
	var/requires_training = TRUE
	var/powered = TRUE
	var/armor_block_chance = 0 //Chance for the power armor to block a low penetration projectile


/obj/item/fusion_fuel
	name = "fusion fuel cell"
	desc = "Some fusion fuel used to recharge the fusion cores of Power Armor."
	icon = 'icons/obj/power.dmi'
	icon_state = "cell"
	item_state = "cell"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	var/fuel = 20000

/obj/item/fusion_fuel/examine(mob/user)
	. = ..()
	to_chat(user, "The charge meter reads [fuel].")

/obj/item/clothing/suit/armor/f13/power_armor/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I,/obj/item/fusion_fuel)&& powered)
		var/obj/item/fusion_fuel/fuel = I
		if(src.powerLevel>=50000)
			to_chat(user, "The fusion core is full.")
			return
		if(fuel.fuel >= 5000)
			src.powerLevel += 5000
			fuel.fuel -= 5000
			to_chat(user, "You charge the fusion core to [src.powerLevel] units of fuel. [fuel.fuel]/20000 left in the fuel cell.")
			return
		to_chat(user, "The fuel cell is empty.")

/obj/item/clothing/suit/armor/f13/power_armor/proc/processPower()
	if(powerLevel>0)//drain charge
		powerLevel -= 1
	if(powerLevel > 20000)//switch to 3 power mode
		if(powerMode <= 2)
			powerUp()
		return
	if(powerLevel > 10000)//switch to 2 power
		if(powerMode <= 1)
			powerUp()
		if(powerMode > 2)
			powerDown()
		return
	if(powerLevel > 5000)//switch to 1 power
		if(powerMode <= 0)
			powerUp()
		if(powerMode > 1)
			powerDown()
		return
	if(powerLevel >= 0)//switch to 0 power
		if(powerMode >= 1)
			powerDown()

/obj/item/clothing/suit/armor/f13/power_armor/proc/powerUp(mob/user)
	powerMode += 1
	slowdown -= 0.2
	var/mob/living/L = loc
	if(istype(L))
		L.update_equipment_speed_mods()
	armor = armor.modifyRating(linemelee = 75, linebullet = 75, linelaser = 75)

/obj/item/clothing/suit/armor/f13/power_armor/proc/powerDown(mob/user)
	powerMode -= 1
	slowdown += 0.2
	var/mob/living/L = loc
	if(istype(L))
		L.update_equipment_speed_mods()
	armor = armor.modifyRating(linemelee = -75, linebullet = -75, linelaser = -75)

/obj/item/clothing/suit/armor/f13/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
	var/mob/living/carbon/human/H = user
	if(src == H.wear_suit) //Suit is already equipped
		return ..()
	if (!HAS_TRAIT(H, TRAIT_PA_WEAR) && slot == SLOT_WEAR_SUIT && requires_training)
		to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
		return 0
	if(slot == SLOT_WEAR_SUIT)
		ADD_TRAIT(user, TRAIT_STUNIMMUNE,	"stun_immunity")
		ADD_TRAIT(user, TRAIT_PUSHIMMUNE,	"push_immunity")
		return ..()
	return

/obj/item/clothing/suit/armor/f13/power_armor/dropped(mob/user)
	REMOVE_TRAIT(user, TRAIT_STUNIMMUNE,	"stun_immunity")
	REMOVE_TRAIT(user, TRAIT_PUSHIMMUNE,	"push_immunity")
	return ..()

/obj/item/clothing/suit/armor/f13/power_armor/emp_act(mob/living/carbon/human/owner, severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(emped == 0)
		if(ismob(loc))
			var/mob/living/L = loc
			to_chat(loc, "<span class='warning'>Warning: electromagnetic surge detected in armor. Rerouting power to emergency systems.</span>")
			slowdown += 1.2
			armor = armor.modifyRating(linemelee = -100, linebullet = -100, linelaser = -100)
			emped = 1
			if(istype(L))
				L.update_equipment_speed_mods()
			spawn(50) //5 seconds of being slow and weak
				to_chat(loc, "<span class='warning'>Armor power reroute successful. All systems operational.</span>")
				slowdown -= 1.2
				armor = armor.modifyRating(linemelee = 100, linebullet = 100, linelaser = 100)
				emped = 0
				if(istype(L))
					L.update_equipment_speed_mods()

/obj/item/clothing/suit/armor/f13/power_armor/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()
	if(damage >= src.dmg_block_threshold && check_armor_penetration(object) >= 0)
		return
	if(src.armor_durability<60)
		return
	if(check_armor_penetration(object) <= src.armor_block_threshold && (attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(armor_block_chance))
			var/ratio = rand(0,100)
			if(ratio <= deflection_chance)
				block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
				return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your power armor absorbs the projectile's impact!</span>")
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
	return



/obj/item/clothing/suit/armor/f13/power_armor/t45b/restored
	name = "restored T-45b power armor"
	desc = "It's a set of early-model T-45 power armor with a custom air conditioning module and restored servomotors. Bulky, but almost as good as the real thing."
	requires_training = TRUE
	powered = TRUE
	slowdown = 0.24
	armor_block_chance = 35
	deflection_chance = 0 //20% chance to block damage from blockable bullets and redirect the bullet at a random angle

/obj/item/clothing/suit/armor/f13/power_armor/vaulttec
	name = "Vault-Tec power armour"
	desc = "A refined suit of power armour, purpose-built by the residents of Vault-115 in order to better keep the peace in their new settlement."
	icon_state = "vaultpa"
	item_state = "vaultpa"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 55, "energy" = 50, "bomb" = 50, "bio" = 60, "rad" = 30, "fire" = 65, "acid" = 15, "wound" = 35)
	slowdown = 0
	armor_block_chance = 40
	deflection_chance = 0 //10% chance to block damage from blockable bullets and redirect the bullet at a random angle. Not a heavy combat model

/obj/item/clothing/suit/armor/f13/power_armor/excavator
	name = "excavator power armor"
	desc = "(VIII) Developed by Garrahan Mining Co. in collaboration with West Tek, the Excavator-class power armor was designed to protect miners from rockfalls and airborne contaminants while increasing the speed at which they could work. "
	icon_state = "excavator"
	item_state = "excavator"
	slowdown = 0.5 //+0.1 from helmet
	armor = list("melee" = 70, "bullet" = 60, "laser" = 40, "energy" = 35, "bomb" = 45, "bio" = 50, "rad" = 50, "fire" = 60, "acid" = 15, "wound" = 20)
	armor_block_chance = 40
	deflection_chance = 0 //10% chance to block damage from blockable bullets and redirect the bullet at a random angle. Not a heavy combat model

/obj/item/clothing/suit/armor/f13/power_armor/t45d
	name = "T-45d power armor"
	desc = "(IX) Originally developed and manufactured for the United States Army by American defense contractor West Tek, the T-45d power armor was the first version of power armor to be successfully deployed in battle."
	icon_state = "t45dpowerarmor"
	item_state = "t45dpowerarmor"
	slowdown = 0.24
	armor = list("melee" = 75, "bullet" = 70, "laser" = 45, "energy" = 45, "bomb" = 65, "bio" = 75, "rad" = 80, "fire" = 85, "acid" = 30, "wound" = 40)
	armor_block_chance = 50
	deflection_chance = 0 //20% chance to block damage from blockable bullets and redirect the bullet at a random angle

/obj/item/clothing/suit/armor/f13/power_armor/t45d/sierra
	name = "sierra power armor"
	desc = "(IX) A captured set of T-45d power armor put into use by the NCR, it's been heavily modified and decorated with the head of a bear and intricate gold trimming. A two headed bear is scorched into the breastplate."
	icon_state = "sierra"
	item_state = "sierra"

/obj/item/clothing/suit/armor/f13/power_armor/t45d/knightcaptain
	name = "Knight-Captain's T-45d Power Armour"
	desc = "(IX) A classic set of T-45d Power Armour only to be used in armed combat, it signifies the Knight Captain and their place in the Brotherhood. A leader, and a beacon of structure in a place where chaos reigns. All must rally to his call, for he is the Knight Captain and your safety is his duty."
	icon_state = "t45dkc"
	item_state = "t45dkc"
	slowdown = 0.16
	armor = list("melee" = 75, "bullet" = 70, "laser" = 45, "energy" = 45, "bomb" = 65, "bio" = 75, "rad" = 80, "fire" = 85, "acid" = 30, "wound" = 40)

/obj/item/clothing/suit/armor/f13/power_armor/midwest
	name = "midwestern power armor"
	desc = "(IX) This set of power armor once belonged to the Midwestern branch of the Brotherhood of Steel, and now resides here."
	icon_state = "midwestgrey_pa"
	item_state = "midwestgrey_pa"
	armor = list("melee" = 75, "bullet" = 70, "laser" = 45, "energy" = 45, "bomb" = 65, "bio" = 75, "rad" = 80, "fire" = 85, "acid" = 30, "wound" = 40)
	armor_block_chance = 50
	deflection_chance = 0 //20% chance to block damage from blockable bullets and redirect the bullet at a random angle

/obj/item/clothing/suit/armor/f13/power_armor/t51b
	name = "T-51b power armor"
	desc = "(X) The pinnacle of pre-war technology. This suit of power armor provides substantial protection to the wearer."
	icon_state = "t51bpowerarmor"
	item_state = "t51bpowerarmor"
	slowdown = 0.15 //+0.1 from helmet = total 0.25
	armor_block_chance = 50
	deflection_chance = 0 //35% chance to block damage from blockable bullets and redirect the bullet at a random angle. Less overall armor compared to T-60, but higher deflection.
	armor = list("melee" = 75, "bullet" = 70, "laser" = 50, "energy" = 45, "bomb" = 70, "bio" = 75, "rad" = 80, "fire" = 85, "acid" = 30, "wound" = 45)
	armor_block_threshold = 0.35
	melee_block_threshold = 35

/obj/item/clothing/suit/armor/f13/power_armor/t51b/tesla
	name = "T-51b tesla armor"
	desc = "(X) The pinnacle of pre-war technology. This suit of power armor provides substantial protection to the wearer, with the added benefit of tesla coils."
	icon_state = "t51tesla"
	item_state = "t51tesla"
	slowdown = 0.15 //+0.1 from helmet = total 0.25
	armor = list("melee" = 75, "bullet" = 70, "laser" = 50, "energy" = 45, "bomb" = 70, "bio" = 75, "rad" = 80, "fire" = 85, "acid" = 30, "wound" = 45)


/obj/item/clothing/suit/armor/f13/power_armor/t60
	name = "T-60a power armor"
	desc = "(XI) Developed in early 2077 after the Anchorage Reclamation, the T-60 series of power armor was designed to eventually replace the T-51b as the pinnacle of powered armor technology in the U.S. military arsenal."
	icon_state = "t60powerarmor"
	item_state = "t60powerarmor"
	slowdown = 0.16
	armor = list("melee" = 75, "bullet" = 75, "laser" = 55, "energy" = 50, "bomb" = 70, "bio" = 80, "rad" = 80, "fire" = 90, "acid" = 30, "wound" = 50)
	melee_block_threshold = 40
	armor_block_threshold = 0.4
	armor_block_chance = 35
	deflection_chance = 0

/obj/item/clothing/suit/armor/f13/power_armor/t60/tesla
	name = "T-60b tesla armor"
	desc = "(X*) An experimental variant of T-60a power armor featuring an array of tesla coils. A small amount of protection has been sacrificed to give a chance to deflect energy projectiles."
	icon_state = "t60tesla"
	item_state = "t60tesla"
	slowdown = 0.15
	armor = list("tier" = 10, "linelaser" = 25, "energy" = 70, "bomb" = 82, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 0, "wound" = 80)
	var/hit_reflect_chance = 20

/obj/item/clothing/suit/armor/f13/power_armor/t60/tesla/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(is_energy_reflectable_projectile(object) && (attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(hit_reflect_chance))
			block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
			return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
	return ..()

/obj/item/clothing/suit/armor/f13/power_armor/advanced
	name = "advanced power armor"
	desc = "(XII) An advanced suit of armor typically used by the Enclave.<br>It is composed of lightweight metal alloys, reinforced with ceramic castings at key stress points.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for its user's comfort."
	icon_state = "advpowerarmor1"
	item_state = "advpowerarmor1"
	armor = list("melee" = 80, "bullet" = 80, "laser" = 60, "energy" = 55, "bomb" = 70, "bio" = 80, "rad" = 90, "fire" = 90, "acid" = 40, "wound" = 70)
	melee_block_threshold = 45
	armor_block_threshold = 0.45
	armor_block_chance = 40
	deflection_chance = 0

/obj/item/clothing/suit/armor/f13/power_armor/advanced/hellfire
	name = "hellfire power armor"
	desc = "(XIII) A deep black suit of Enclave-manufactured heavy power armor, based on pre-war designs such as the T-51 and improving off of data gathered by post-war designs such as the X-01. Most commonly fielded on the East Coast, no suit rivals it's strength."
	icon_state = "hellfire"
	item_state = "hellfire"
	melee_block_threshold = 50
	armor_block_threshold = 0.5
	armor_block_chance = 70
	deflection_chance = 0
	armor = list("melee" = 90, "bullet" = 90, "laser" = 70, "energy" = 65, "bomb" = 80, "bio" = 90, "rad" = 100, "fire" = 90, "acid" = 50, "wound" = 90)

/obj/item/clothing/suit/armor/f13/power_armor/tesla
	name = "tesla power armor"
	desc = "A variant of the Enclave's advanced power armor Mk I, jury-rigged with a Tesla device that is capable of dispersing a large percentage of the damage done by directed-energy attacks.<br>As it's made of complex composite materials designed to block most of energy damage - it's notably weaker against kinetic impacts."
	icon_state = "tesla"
	item_state = "tesla"
	armor = list("melee" = 75, "bullet" = 75, "laser" = 70, "energy" = 55, "bomb" = 70, "bio" = 80, "rad" = 90, "fire" = 95, "acid" = 30, "wound" = 70)
	var/hit_reflect_chance = 35

/obj/item/clothing/suit/armor/f13/power_armor/tesla/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(is_energy_reflectable_projectile(object) && (attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(hit_reflect_chance))
			block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
			return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
	return ..()

*/
