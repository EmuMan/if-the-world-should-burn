"If The World Should Burn" by Jacob Kelleran

Include Quip-Based Conversation by Michael Martin.
Include Basic Screen Effects by Emily Short.

Section 1 - Testing Descriptions - Not for release

When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "WARNING: [item] has no description."

Section 2 - Setup and Definitions

A person has a number called max health.
A person has a number called present health.
The max health of a person is usually 100.
The present health of a person is usually 100.
Definition: a person is dead if his present health is less than 1.

The max health of the player is 100.
The present health of the player is 100.

A mini dog is a kind of value. The mini dogs are diamond shiba inu, orange tabby cat, springer spaniel, golden retriever, corgi, shih tzu, border collie, malamute, husky, Australian shepherd, beagle, Bernese mountain dog, black lab.

When play begins:
	now the generic ask quip is "They stare at you. Their gaze pierces your soul. A sense of dread begins to take over. What do they see? Can they read your mind? Do they know what you've done?? Have you even done anything wrong???";
	now the left hand status line is "[the player's surroundings] / [the present health of the player] hp".

Every turn when the player is dead:
	end the story saying "You are now dead. Sucks to suck."

Check talking to when the noun is not a person:
	say "You're talking to inanimate objects now? You must be really stuck. Or maybe you're just messing around." instead;

Feeding is an action applying to one thing.
Understand "feed [something]" as feeding.
Check feeding:
	if the dog food is carried:
		say "Don't waste the dog food like that! It might come in handy later! Like, say you hypothetically encountered a hypothetically dog-like creature and hypothetically needed to calm it down. Purely hypothetically of course. What would you do if you had no dog food? Pet it? Pssht, preposterous." instead;
	otherwise:
		say "Nice try, but you can't feed that." instead;

Petting is an action applying to one thing.
Understand "pet [something]" and "pat [something]" and "boop [something]" as petting.
Check petting:
	if the noun is an animal:
		say "A single pet sends the [noun] into leaps and bounds of happiness." instead;
	otherwise:
		say "A single pet sends you into a spiral of questioning why you would want to pet a [noun]." instead.

Section 3 - Dialogue

Table of Quip Texts (continued)
quip	quiptext
lapis-greeting	"'Hi, my name is Lapis!'"
lapis-discuss-lapis	"'Oh, me? I'm here to guide you guys through this place! The Cavern can get a little tricky, so they put me here to show you where to go or answer any basic questions you have.'"
lapis-discuss-the-cavern	"Lapis looks around the room. 'Yeah, the Cavern is a bit intimidating. I feel like they probably got a little lazy designing this section. Well, not that the rest of it is much better, I suppose. Maybe they wanted to test your social skills through talking to me? Or something? Oh right! You probably want to get out of here. Hmm, I was told there's a structure to your south that you should be able to reach on foot. Can't see it now, but apparently you also can't miss it once you get closer. Not sure what that means.'"
lapis-discuss-the-dawg	"'[if the dawg is dead]The dawg? What about it? You've killed it, there's not much else to be discussed. For now at least.[otherwise]The dawg? Yeah, sorry for the aggression, but it looks like you handled it well! Gives you good karma, I suppose.[end if]'"

Table of Lapis Conversation
prompt	response	enabled
"Who are you?"	lapis-discuss-lapis	1
"Where are we?"	lapis-discuss-the-cavern	1
"What was that that????"	lapis-discuss-the-dawg	0

Section 4 - Functions

To pacify the dawg:
	now the dawg is passive;
	enable the lapis-discuss-the-dawg quip for Lapis.

To reveal the dawg:
	now the dawg is described;
	now the dawg is done.

To do a gacha pull:
	say "A series of mechanical noises emit from the gacha machine, as your prize makes it down to the output container. Finally, with a loud 'Ding!', everything settles into place. Inside is...[paragraph break]";
	if a random chance of 1 in 100 succeeds:
		say "A small model of a shiba inu! Is it made of glass? It looks a little too shiny for that to be true... no, wait, is it made of... diamond???";
	otherwise if a random chance of 1 in 10 succeeds:
		say "... a cat? A little model of an orange tabby cat? Huh. I thought this machine was supposed to dispense dogs.";
	otherwise if a random chance of 1 in 6 succeeds:
		say "A mini springer spaniel! What a great dog. Probably the best kind. Objectively, and without the bias of the author.";
	otherwise:
		say "A mini [a random mini dog between golden retriever and black lab]! How cute!".

To do a realm transition:
	wait for any key;
	say "[paragraph break]The world goes dark.";
	wait for any key;
	clear only the main screen;

Section 5 - Story

The Outdoors Area is a region. The sky is a backdrop in the Outdoors Area. The sky has the description "A brilliant blue sky hangs above you, spotted with a few clouds. The view is nice, but looking at the sun hurts. Maybe don't do that. Actually, you know what? -10 hp. Not because it actually hurt that badly but because that was stupid and this is your punishment."
After examining the sky:
	decrease the present health of the player by 10.

The Driveway is a room in the Outdoors Area. "A paved driveway sits between a small house to the north and a road to the south that seems to stretch all the way to the horizons. The driveway is surrounded by tall grass, hiding the other surroundings. You can see that the door to the house in front of you sits ajar, although calling the entrance inviting is a bit of a stretch."

The Road is south of the driveway. The road is in the Outdoors Area. The road has the description "Footfalls meet the asphalt surface of an unremarkable road below you. Well, unremarkable except for the fact that it seems to stretch endlessly in both directions. How strange. And wait, is that a gacha machine? What is that doing here?"
The road is east of the road.
Instead of going from the road to the road:
	say "With the first step taken in that direction, a large truck comes roaring down the road from behind at alarming speed and the fleshy human it runs into is no match for its sheer inertia.";
	end the story saying "Where did that come from? You're sure that nothing was there just a second ago."

The gacha machine is scenery in the road. The gacha machine has the description "A nondescript gacha machine sits on the south side of the road, displaying a large image of a shiba inu on the front. A sizeable lever sits on the side and an output container can be easily seen on the front. It looks to be fully functional."
The gacha lever is scenery on the gacha machine. The description of the lever is "A lever that can be pulled to run the gacha machine. Why don't you try your luck?"
The gacha output container is scenery on the gacha machine. The description of the output container is "An output container for the gacha machine. Nothing currently sits inside, but the gambler inside you wants to see it filled."
Instead of pulling the lever, do a gacha pull.

The House is north of the driveway. "[if unvisited]When you first enter the house, you can hear the old floorboards creaking in protest as they struggle to support the weight of a person. [end if]The house seems to be comprised of a single room, save for a staircase pushed up against one wall leading down into the floor. A single iron stove sits against another wall, filled with the remnants of a wood fire long extinguished."

The iron stove is scenery in the House. "A cast-iron stove sits pushed up against a wall. Strangely, there seems to be no method of ventilation. Perhaps it's hidden behind the stove?"

A pot is on the stove. The pot has the description "A pot holding a single uncooked macaroni noodle, which seems to have been fused to the pan's bottom through the stresses of time. Or something."

The suspicious sandwich is on the stove. The suspicious sandwich is edible. The suspicious sandwich has the description "A suspicious-looking sandwich that looks processed to no end. How long has this been here? You can see the dust collecting on the top but it somehow still looks to be in pristine condition. It would probably kill whoever ate it, but if they were going to die anyways, why not give it a shot?"
After eating the suspicious sandwich:
	if the present health of the player is the max health of the player:
		now the present health of the player is 0;
		say "Okay, really? At full health??? Why eat random things from the ground if death is nowhere to be seen?????";
	otherwise:
		now the present health of the player is the max health of the player;
		say "The sandwich has been consumed, and... max HP! Guess it wasn't so bad after all."

The Basement is below the House. "[if unvisited]The footfalls on the steps cause dust to fall from cracks you didn't even know existed. Eventually, the stairway opens up into a large chamber. [end if]The walls of this small room appear to have been constructed using stones of varying sizes.[if unvisited] Interestingly, the closer they are examined, the more one can make out smaller stones filling in the cracks, like some sort of neverending fractal.[end if] Their flow is only broken by a large mirror sitting on the wall to the east."

The mirror is a door. The mirror is east of the Basement. The mirror is west of the Flipped Basement. The mirror can be broken or unbroken. The mirror is unbroken and open.

The mirror has the description "A large framed mirror leans on one wall, reflecting all of its surroundings.[if the mirror is broken] Well, almost everything; a human figure is distinctly missing from its image.[otherwise] Just looking at it fills you with the desire to see it in shards on the ground.[end if]"

Instead of entering the mirror:
	if the mirror is unbroken:
		say "You try to enter the mirror but the mirror's reflection blocks the way.";
	otherwise:
		continue the action.

Instead of opening the mirror:
	say "Open the... mirror? Why would you try to do that? It's not a door... right?".
	
Instead of closing the mirror:
	say "Close the... mirror? Why would you try to do that? It's not a door... right?".

Instead of attacking the mirror when the player has the pot:
	if the mirror is unbroken:
		say "The pot, travelling with a good amount of momentum, hits the mirror. Except, it doesn't actually hit the mirror; it hits the pot on the other side. With a crash, the human reflection shatters as glass would, breaking the inherent connection between the two sides.[paragraph break]THE BARRIER HAS BEEN BROKEN.";
		now the mirror is broken;
	otherwise:
		say "The pot swings straight through the mirror, as there is no longer a matching reflection to resist."

Instead of attacking the mirror when the player does not have the pot:
	if the mirror is unbroken:
		say "The sound of flesh on flesh reaches your ears as two fists collide on the surface of the mirror. An interesting result. That probably hurt as well. Perhaps a more hefty implement is needed.";
		decrease the present health of the player by 20;
	otherwise:
		say "As there is no human reflection to resist, the punch travels straight through the mirror."

The Flipped Basement is a room. The Flipped Basement has the description "A mirror image of the basement first entered, this room displayes all of the same properties. Except, well, everything is flipped here."

The reflection shards are in the flipped basement. The reflection shards are edible. The reflection shards have the description "A bunch of shards that remain from the human reflection that once blocked the path through the mirror. For some reason, they feel like sugar? Maybe they can be eaten. Who knows."
After eating the reflection shards:
	if the present health of the player is the max health of the player:
		now the present health of the player is 130;
		say "The sharp edges of the reflection shards create shallow cuts inside the mouth of the one consuming them. Somehow, they seem to have an invigorating effect, despite an initially perfectly healthy condition. Are you sure that was sugar and not... some other crystalline substance?";
	otherwise:
		now the present health of the player is the max health of the player;
		say "The reflection shards have been consumed. A little strange, but they do seem to have had a positive effect. Hmm, you know what? Max HP! You're welcome."

The Flipped House is above the flipped basement. The flipped house has the description "A house identical to the one on the other side, except for the stove is now gone, along with everything on top of it. The walls are painted white now as well, and there seemingly aren't any windows or doors in this version, just a hole in the wall to the south... maybe calling it identical wasn't the most accurate description."

The dog food is in the flipped house. The description of the dog food is "A labeled can of dog food from a brand called 'Dan the Dawg'."

The Cavern is south of the Flipped House. "A large cavern surrounds you. The ceiling seems impossibly high, but you can still make out stalactites hanging down from above, spears of stone that could kill a person in an instant. A slight fog reaching far into the distance obscures any trace of the cavern walls, if there are any. [if the dawg is undescribed]A person[otherwise]Lapis[end if] stands there with an excited look in her eyes.[if the dawg is undescribed] There are people in this world? Huh.[otherwise] And, of course...[end if]"

Lapis is an undescribed woman in the cavern. Lapis has the description "A woman with a flowing blue dress with golden highlights sprinkled throughout stands in front of the flipped house. She wears an excited smile on her face, as if she was waiting for you to make it through the barrier."
Understand "person" and "woman" as Lapis. The greeting of Lapis is lapis-greeting. The litany of Lapis is the Table of Lapis Conversation.

The dawg is an undescribed neuter animal in the cavern. The dawg can be either passive or aggressive. The dawg is aggressive. The dawg can be alive or dead. The dawg is alive. The dawg can be either ready or done. The dawg is done. The dawg has the description "You think this is a dog, but you're not sure. It looks vaguely dog-like, but more... cool. So you'll just call it a dawg."
Understand "dog" as the dawg.

The dawg corpse is an animal. The dawg corpse is nowhere. The dawg corpse has the description "The corpse of the dawg that was killed earlier."

[Ways to encounter the dawg]
Instead of going from the Cavern to the Golden Hall when the dawg is aggressive:
	if the dawg is described:
		say "Running past the dawg? Sounds like... a plan of sorts. Surely it's not that fast! Right?...";
	otherwise:
		say "A decision is made to move forward on your journey, continuing southward. But suddenly, a large... dog? It kinda looks like one, at least. Kinda. Let's just call it a dawg for now. Either way, it's attacking now! -20 hp for the claw marks it inflicted as you were trying to figure out what it was.";
		decrease the present health of the player by 20;
		reveal the dawg.
Instead of examining or attacking or feeding or talking to or petting the dawg when the dawg is undescribed:
	say "Alright, fess up. How did you know the dawg was there? Are you cheating? Is this not your first session? Hmph. I'm watching you now... well, not that I wasn't before, but now I'm WATCHING watching you. Okay?[paragraph break]Oh, also, the dawg is now attacking you. That's what you get.";
	reveal the dawg.

[Ways to attack the dawg]
Instead of attacking the dawg when the dawg is described:
	if the player has the pot:
		say "With a solid 'Thwack!', the pot strikes the dawg and immediately sends it to its grave. Congratulations. An atrocity has been committed. A war crime. A violation of the Geneva Convention. And it is on your hands. A single tear falls to the ground, an unstoppable expression of human emotion from he who has slain the beast. Why must it end like this? But hey, at least it's not attacking anyone anymore. Was it worth it? There must have been another way, right?";
		pacify the dawg;
		now the present health of the dawg is 0;
		now the dawg is nowhere;
		now the dawg corpse is in the cavern;
	otherwise:
		say "An attempt to punch the dawg ends in complete and utter failure as it simply chomps down on the fist that just tried to attack it. If you were going to choose violence, maybe you should have remembered the pot. -30 hp for that blunder.";
		decrease the present health of the player by 30;
		now the dawg is done.

[Ways to properly subdue the dawg]
Instead of petting the dawg when the dawg is described:
	if the dawg is aggressive:
		say "The dawg perceives the hand reaching out to pet it as a threat and latches its teeth onto it, causing great pain to the human on the other end. But suddenly, another hand comes out of the darkness, stroking the dawg's fur lovingly! What a great ending! The dawg feels relaxed now, and lays down on the floor to fall asleep. It's suddenly cute appearance instantly heals all of the damage it did. Good choice, player.";
		pacify the dawg;
	otherwise:
		say "The dawg purrs in satisfaction as a hand runs over its soft fur. Probably not the sound anyone was expecting, but clearly something is being done right.".
Instead of feeding the dawg when the dawg is described:
	if the dawg is passive:
		if the dog food is carried:
			say "The dawg is curled up on the ground snoring at this point, so instead of getting fed immediately, it is left with a tasty treat in front of it to wake up to. How cute.";
		otherwise:
			say "A search through jacket pockets reveals no food that the dawg would like. So it receives a pat on the head instead. Good enough.";
	otherwise:
		if the dog food is carried:
			say "The dawg lunges out to attack! However, to it's surprise, what meets its mouth is not human flesh, but a metal can of dog food! As its teeth clamp down and pierce through the aluminum, the wonderful juices of the food pour into its mouth. 'Dan the Dawg...' it whispers, a single tear rolling down its cheek. 'My favorite.' The dawg sets it down and continues to consume its meal as a human would an exquisit steak from a restaurant with three Michelin stars. Good choice, player.";
			pacify the dawg;
		otherwise:
			say "A frantic search through jacket pockets comes up with no food that the dawg would like! A travesty that could probably have been prevented! Your inaction costs -50 hp.";
			decrease the present health of the player by 50;
			now the dawg is done.

[Other dawg interactions]
Before going from the Cavern to the Flipped House when the dawg is aggressive and the dawg is described:
	say "An effort is made to run away from the dawg, but it chases, allowing it to get a couple scratches in. They aren't much, but it still hurts. It eventually decides to leave; it seems almost scared of the house. Not the worst case scenario, but still -25 hp for the injuries sustained.";
	decrease the present health of the player by 25;
	now the dawg is done.
Every turn when the dawg is aggressive and the dawg is described and the player is in the cavern:
	if the dawg is ready:
		say "... also, you unfortunately can't just ignore the dawg. It is still very much attacking. -50 hp.";
		decrease the present health of the player by 50;
	otherwise:
		now the dawg is ready.

[Dawg corpse interactions]
Instead of attacking the dawg corpse:
	say "The dawg is already dead. Don't you think it's suffered enough? Why keep attacking it like that?"
Instead of petting the dawg corpse:
	say "What is done is done, and the dawg is now beyond the realm of the living. Any pets given will not be received."
Instead of feeding the dawg corpse:
	say "What is done is done, and the dawg is now beyond the realm of the living. Any food given will not be received."

The Golden Hall is south of the Cavern. "A hall that seems to be made out of pure gold with its raised roof towering above you, the interior of the Golden Hall is certainly a sight to behold. Pillars stretch up so far you cannot believe they can hold even their own weight, and the light from the torches on the walls create mesmerising reflections that seem to move like they are refracting through water. And, as you get a grip on your surroundings, you realize that there actually is some water in this room, flowing from a fountain on the other end."
Before going from the Cavern to the Golden Hall when the dawg is not aggressive:
	say "Lapis waves goodbye as she disappears into the fog. The Cavern seems to go on and on. Several minutes pass before anything of note comes into view, but when the destination finally emerges from the fog, its brilliance is almost overwhelming. An enormous structure that seems to be made out of pure gold stands in stark contrast to the drearyness of the rest of the cave, its entrance an elegant archway that could have been made for giants. A few more minutes of walking and one deep breath later, you cross the threshold."
Instead of going from the Golden Hall to the Cavern:
	say "A glance behind reveals that the entranceway has somehow been sealed and is now a solid wall identical to the rest of the room. It appears that you cannot leave this place so easily."

The Fountain of Reality is scenery in the Golden Hall. The fountain can be either observed or unobserved. The fountain is unobserved. The Fountain of Reality has the description "A tall, shimmering fountain at the far end of the hall that features continuously flowing water coming from an outlet sticking out of the surface. The fountain appears to be made out of a quartz-like substance, but features some iridescent properties, giving it a rainbow-like sheen."
Instead of examining the Fountain of Reality when the fountain is unobserved:
	say "The fountain is across the hall, and takes several strides to reach, so you start moving. Once you get there, you peer into its shimmering, barely disturbed surface, and in its reflection, instead of a human figure, you can only see the ceiling of the Golden Hall shimmering back at you.[paragraph break]'If the world should burn, would you shoulder its burden?'[paragraph break]You whip your gaze around and see Lapis standing behind you, despite not seeing her for the entire journey here. Her previously excited expression has been replaced with a blank stare that could bore into a soul. But she's not staring at you.[paragraph break]She's staring at the person standing in front of the fountain.";
	wait for any key;
	say "[paragraph break]The world goes dark.";
	wait for any key;
	clear only the main screen;
	say "The world darkens as you are suddenly surrounded by cold water. You are clearly not in the Golden Hall anymore, but you definitely didn't leave of your own accord.";
	now the player is in The Depths;

The Depths is a room. "The surface of the water shimmers in an entrancing pattern, its beckoning light teasing from far above. Down here though, everything has a deep blue hue, and you can just make out the surface down below. Looking even closer, the shape of a person can be made out, though his blue outfit blends in quite well with the surroundings. You feel as though his name would be Lazuli, but you're not sure how.[if unvisited] Strange place for a person to be, but I must say his drip is immaculate, and... what? Oh, sorry, you're probably right. I'll take it more seriously now.[end if][if Lazuli is dead] Unfortunately, Lazuli is now dead, as he was not removed from the rocks in time and ended up drowning.[end if]"

Lazuli is a man in The Depths. Lazuli has the description "[if Lazuli is in The Depths]A man struggles on the ocean floor, seemingly having caught his leg on something. His hand extends out, as if he is asking for someone to help pull him free.[otherwise]A man recently rescued from the depths, bobbing on the surface of the ocean and gasping for breath. How does one end up as he did? Maybe you can ask.[end if]".
Lazuli has a number called stuckness.
The stuckness of Lazuli is 5.
Definition: Lazuli is free if his stuckness is less than 1.
Understand "hand" and "man" and "person" as Lazuli.

Lazuli's corpse is a man. Lazuli's corpse is nowhere. Lazuli's corpse has the description "The corpse of a man who recently drowned, his leg still stuck in a crevice in the ground."
Understand "Lazuli" and "man" and "person" as Lazuli's corpse.

Instead of talking to Lazuli when Lazuli is in The Depths:
	say "Speaking isn't exactly a trivial task while underwater, so only bubbles come out."
Instead of pulling or taking Lazuli:
	if the stuckness of Lazuli is 5:
		say "Lazuli quickly accepts the hand being extended towards him, and with a solid yank, his leg seems to shift in place. It's good progress, but no person can stay down here forever. They will run out of oxygen eventually.";
	otherwise if the stuckness of Lazuli is 4:
		say "With another yank, Lazuli's leg seems to budge a bit more, but it is still wedged pretty badly into the ground. How did he even end up like this? Oxygen is starting to run low for both people involved; you feel as though swimming to the surface now will spell the end for the Lazuli.";
	otherwise if the stuckness of Lazuli is 3:
		say "Lazuli's whole body shifts forward, and a few rocks tumble from the place his leg is stuck in. Just a couple more tugs and he should be free, but is there time to do so?";
	otherwise if the stuckness of Lazuli is 2:
		say "Both parties pull as hard as they can, giving their all to this final stretch. Lazuli budges forward even more, and it is now clear that the only thing that remains caught is the fabric of his pant leg. The lack of oxygen is becoming more intense than ever, and primal instinct begins to kick in, calling for a breath to be taken.";
	otherwise if the stuckness of Lazuli is 1:
		say "With a final tug and a tear of fabric, Lazuli breaks free, rocks cascading in to fill the gap where his leg used to be. Both parties are okay, but a searing pain in the lungs indicates that the only reasonable action is to swim upwards.";
	otherwise if Lazuli is free:
		say "Lazuli has already been freed. Staying down here any longer would be a poor decision to make.";
	decrease the stuckness of Lazuli by 1;
	if the present health of the player is greater than 20:
		decrease the present health of the player by 5.

Instead of pulling or taking Lazuli's corpse:
	say "Lazuli is now no more than a corpse. Freeing him now would not accomplish anything of significance. Even so, an attempt can be made to do so.[paragraph break]'I see you've made your decision.'[paragraph break]You whip around to see, again, Lapis standing behind you. Although this time she seems to be more of a vision than anything else, as it seems as though she is not actually submerged in water. In fact, you can even make out a single tear falling down her cheek.[paragraph break]'Just remember my question. If the world should burn...'[paragraph break]You don't hear her finish as the world returns to darkness, but you do notice that her gaze, unlike last time, has shifted to point directly at you.";
	do a realm transition;
	now the player is in The Hill.

Before going from The Depths to The Surface:
	if Lazuli is free:
		now Lazuli is in The Surface;
	otherwise:
		now Lazuli is nowhere;
		now Lazuli's corpse is in The Depths;
		now the present health of Lazuli is 0.

The Surface is above the depths. "You find yourself above the surface of the ocean, watching waves roll around you. The water isn't exactly rough, but it's definitely not perfectly calm either. The horizon is all you can observe on all sides; there seems to be no land in sight."

Instead of talking to Lazuli when Lazuli is in The Surface:
	say "Lazuli's mouth is open before you can even decide to do the same. 'Well done, player,' he says, bowing his head. 'I urge you to continue to consider the question as you enter the next realm. If the world should burn...'[paragraph break]You don't hear him finish as the world returns to darkness, but you do notice that his gaze, unlike that of Lapis, is directed straight at you.";
	do a realm transition;
	now the player is in The Hill.

The Hill is a room. "Standing atop this hill gives one a great vantage point over the village below. It is not bustling with activity, as you feel it should have been. Instead, it lays in ruin, ransacked and pillaged, with buildings caving down where fires have overtaken them. The sky almost seems to glow red with destruction, an ominous air over such a tragic sight. Yeah, okay, you got me. This time I can't even think of anything quippy to say. It's just sad, really.[paragraph break]Anyways, a path leads down to the north into a section of the village that seems to still be traversable."
