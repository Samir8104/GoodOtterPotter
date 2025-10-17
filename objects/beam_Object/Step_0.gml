
// there is some redudant code in here, but it runs fine :P
// I'll remove the redudant stuff later - Samir

var dangerTime = 0;
var threshold = 0;
var gameActive = true;
var driftTimer = 0;
var driftInterval = irandom_range(0, 20);

if(minigameActive and instance_exists(dangerBar_Object)) {
	plr_Object.sprite_index = plr_balance
	var minVal = (dangerBar_Object.sprite_width / 2) * -1
    var maxVal = dangerBar_Object.sprite_width / 2
	var leftPressed = keyboard_check_pressed(ord("A"));
	var rightPressed = keyboard_check_pressed(ord("D"));
	
	if(leftPressed and !rightPressed) {
		arrowPos -= 1;
		show_debug_message("Pressing left")
	}
	if(rightPressed and !leftPressed) {
		arrowPos += 1;
		show_debug_message("Pressing right")
	}
	
	driftTimer += 1;
	if(driftTimer >= driftInterval) { 
		var driftDirection = choose(-1, 1);
		var driftAmount = 1
		arrowPos += driftDirection * driftAmount
		show_debug_message("Hi I should be running")
		driftTimer = 0;
		driftInterval = irandom_range(60, 120);
	}
	arrowPos = clamp(arrowPos, minVal, maxVal);
	
	var barWidth = dangerBar_Object.sprite_width * dangerBar_Object.image_xscale;
	var centerX = dangerBar_Object.x;
	var pixelsPerUnit = (barWidth / 2) / maxVal;
    
	arrow_Object.x += arrowPos
	show_debug_message("Arrow X is.." + string(arrow_Object.x))
	
	var successZoneMin = successBar_Object.x - (successBar_Object.sprite_width * successBar_Object.image_xscale / 2);
	var successZoneMax = successBar_Object.x + (successBar_Object.sprite_width * successBar_Object.image_xscale / 2);
	var inSuccessZone = (arrow_Object.x >= successZoneMin and arrow_Object.x <= successZoneMax);
	
	gameTimer += 1;
	show_debug_message("Am I in successZone?" + string(inSuccessZone))
	show_debug_message("GameTimer:" +string(gameTimer))
	show_debug_message("GameDuration:" + string(gameDuration))
	if(gameTimer >= gameDuration) {
		gameActive = false;
		
		if(inSuccessZone) {
			show_debug_message("Minigame Won!");
			plr_Object.sprite_index = plr_idle
			plr_Object.state = PlayerStates.idle;
			instance_destroy(dangerBar_Object);
			instance_destroy(successBar_Object);
			instance_destroy(arrow_Object);
		} else {
			show_debug_message("Minigame Lost!");
			plr_Object.state = PlayerStates.idle;
			plr_Object.y += 300
			instance_destroy(dangerBar_Object);
			instance_destroy(successBar_Object);
			instance_destroy(arrow_Object);
		}
	}
}