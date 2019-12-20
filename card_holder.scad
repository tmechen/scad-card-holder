card_w = 85.6 + 2;
card_d = 53.98 + 2;
card_r = 2.9;
border_w = 1.5;
bottom_h = 1;
edge_w = 15;
edge_bevel = 5;
border_h = 3;
cutout_scale = 0.35;

h = border_h + bottom_h;

$fn = 50;

difference() {
    hull() {
        for (x = [-1, 1]) {
            for (y = [-1, 1]) {
                translate([y * (card_w / 2 + border_w - card_r), x * (card_d / 2 + border_w - card_r), 0])
                cylinder(h=h, r=card_r);
            }
        }
    }
    
    hull() {
        for (x = [-1, 1]) {
            for (y = [-1, 1]) {
                translate([y * (card_w / 2 - card_r), x * (card_d / 2 - card_r), bottom_h])
                cylinder(h=h, r=card_r);
            }
        }
    }
    
    for (y = [-1, 1]) {
        cutout_r = card_w / 2 - edge_w;
        translate([0, y * (card_d / 2 + border_w), 0])
        scale([1, cutout_scale, 1]) {
            translate([0, 0, bottom_h/2])
            cylinder(h=h+1, r1 = cutout_r, r2 = cutout_r + edge_bevel);
            translate([0, 0, -1])
            cylinder(h=h+1, r = cutout_r);
        }
    }
    
    for (x = [-1, 1]) {
        cutout_r = card_d / 2 - edge_w;
        translate([x * (card_w / 2 + border_w), 0, 0])
        scale([cutout_scale, 1, 1]) {
            translate([0, 0, bottom_h/2])
            cylinder(h=h+1, r1 = cutout_r, r2 = cutout_r + edge_bevel);
            translate([0, 0, -1])
            cylinder(h=h+1, r = cutout_r);
        }
    }
}