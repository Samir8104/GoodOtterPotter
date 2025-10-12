draw_set_halign(fa_left)
draw_set_colour(c_white)
draw_text(32,32, "FRAGMENTS COLLECTED: ") // 4 fragments == 1 pot :D
draw_set_colour(c_white)
var fragments = string(score)
draw_text_transformed(90, 48, fragments + "/4", 2, 2, 0);
draw_sprite_ext(pottery_sprite, 0, 32, 48, 0.1, 0.1, 0, c_white, 1);
draw_text(32, 90, "POTTERY COLLECTED: ")
var pots = string(Pots)
draw_text_transformed(90, 102, pots , 2, 2, 0);
draw_sprite_ext(pot_sprite, 0, 32, 110, 0.04, 0.04, 0, c_white, 1);


