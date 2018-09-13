/****** P A N D E M I C *****/

var redC = color(245, 106, 46);
var blueC = color(34, 132, 230);
var blackC = color(94, 94, 94);
var yellowC = color(250, 231, 23);

//arrays that dont change
var drawP = [
    {name: "Atlanta", country: "United States", color: blueC, type: "city", xPos: 175, yPos: 162, connections: ["Chicago","Miami","Washington"]},
    {name: "Johannesburg", country: "South Africa", color: yellowC, type: "city", xPos: 320, yPos: 288, connections: ["Khartown", "Kinshasa"]},
    {name: "Istanbul", country: "Turkey", color: blackC, type: "city", xPos: 347, yPos: 181, connections: ["Milan","St. Petersburg","Moscow","Baghdad","Cairo","Algiers"]},
    {name: "Hong Kong", country: "China", color: redC, type: "city", xPos: 452, yPos: 197, connections: ["Taipei","Manila","Ho Chi Minh City","Bangkok","Kolkata","Shanghai"]},
    {name: "San Francisco", country: "United States", color: blueC, type: "city", xPos: 124, yPos: 150},
    {name: "Chicago", country: "United States", color: blueC, type: "city", xPos: 154, yPos: 140},
    {name: "Toronto", country: "Canada", color: blueC, type: "city", xPos: 183, yPos: 131},
    {name: "New York", country: "United States", color: blueC, type: "city", xPos: 220, yPos: 136},
    {name: "Washington", country: "United States", color: blueC, type: "city", xPos: 215, yPos: 157},
    {name: "London", country: "Great Britain", color: blueC, type: "city", xPos: 283, yPos: 147},
    {name: "Madrid", country: "Spain", color: blueC, type: "city", xPos: 276, yPos: 179},
    {name: "Paris", country: "France", color: blueC, type: "city", xPos: 301, yPos: 166},
    {name: "Essen", country: "Germany", color: blueC, type: "city", xPos: 327, yPos: 141},
    {name: "Milan", country: "Italy", color: blueC, type: "city", xPos: 321, yPos: 179},
    {name: "St. Petersburg", country: "Russia", color: blueC, type: "city", xPos: 343, yPos: 111},
    {name: "Los Angeles", country: "United States", color: yellowC, type: "city", xPos: 144, yPos: 175},
    {name: "Mexico City", country: "Mexico", color: yellowC, type: "city", xPos: 177, yPos: 193},
    {name: "Miami", country: "United States", color: yellowC, type: "city", xPos: 211, yPos: 180},
    {name: "Bogota", country: "Columbia", color: yellowC, type: "city", xPos: 198, yPos: 222},
    {name: "Lima", country: "Peru", color: yellowC, type: "city", xPos: 183, yPos: 250},
    {name: "Santiago", country: "Chile", color: yellowC, type: "city", xPos: 188, yPos: 284},
    {name: "Sao Paulo", country: "Brazil", color: yellowC, type: "city", xPos: 240, yPos: 243},
    {name: "Buenos Aires", country: "Argentina", color: yellowC, type: "city", xPos: 226, yPos: 273},
    {name: "Lagos", country: "Nigeria", color: yellowC, type: "city", xPos: 298, yPos: 234},
    {name: "Kinshasa", country: "The Republic of Congo", color: yellowC, type: "city", xPos: 313, yPos: 256},
    {name: "Kartoum", country: "Sudan", color: yellowC, type: "city", xPos: 341, yPos: 248},
    {name: "Algiers", country: "Algeria", color: blackC, type: "city", xPos: 301, yPos: 204},
    {name: "Cairo", country: "Egypt", color: blackC, type: "city", xPos: 334, yPos: 204},
    {name: "Moscow", country: "Russia", color: blackC, type: "city", xPos: 372, yPos: 161},
    {name: "Tehran", country: "Iran", color: blackC, type: "city", xPos: 385, yPos: 179},
    {name: "Baghdad", country: "Iraq", color: blackC, type: "city", xPos: 368, yPos: 196},
    {name: "Riyadh", country: "Saudi Arabia", color: blackC, type: "city", xPos: 369, yPos: 222},
    {name: "Karachi", country: "Pakistan", color: blackC, type: "city", xPos: 389, yPos: 213},
    {name: "Mumbai", country: "India", color: blackC, type: "city", xPos: 392, yPos: 237},
    {name: "Delhi", country: "Delhi", color: blackC, type: "city", xPos: 402, yPos: 197},
    {name: "Kolkata", country: "India", color: blackC, type: "city", xPos: 422, yPos: 209},
    {name: "Chennai", country: "India", color: blackC, type: "city", xPos: 415, yPos: 226},
    {name: "Bangkok", country: "Thailand", color: redC, type: "city", xPos: 446, yPos: 223},
    {name: "Jakarta", country: "Indonesia", color: redC, type: "city", xPos: 429, yPos: 254},
    {name: "Beijing", country: "China", color: redC, type: "city", xPos: 461, yPos: 154},
    {name: "Shanghai", country: "China", color: redC, type: "city", xPos: 456, yPos: 177},
    {name: "Ho Chi Minh City", country: "Vietnam", color: redC, type: "city", xPos: 455, yPos: 240},
    {name: "Seoul", country: "South Korea", color: redC, type: "city", xPos: 485, yPos: 159},
    {name: "Taipei", country: "Taiwan", color: redC, type: "city", xPos: 477, yPos: 205},
    {name: "Manila", country: "The Phillipines", color: redC, type: "city", xPos: 493, yPos: 251},
    {name: "Sydney", country: "Australia", color: redC, type: "city", xPos: 480, yPos: 297},
    {name: "Tokyo", country: "Japan", color: redC, type: "city", xPos: 494, yPos: 190},
    {name: "Osaka", country: "Japan", color: redC, type: "city", xPos: 498, yPos: 212},
    {type: "spev", description: ""},
    {type: "epidemic"}
    ]; 
var roles = [
    {name: "Troubleshooter", description: "", color: color(227, 45, 70)},
    {name: "Medic", description: "", color: color(217, 163, 3)},
    {name: "Generalist", description: "", color: color(112, 112, 112)},
    {name: "Scientist", description: "", color: color(235, 235, 235)},
    {name: "Researcher", description: "", color: color(168, 122, 49)},
    {name: "Field Operative", description: "", color: color(247, 247, 40)},
    {name: "Operations Expert", description: "", color: color(65, 194, 58)},
    {name: "Dispatcher", description: "", color: color(186, 80, 184)}, 
    {name: "Archivist", description: "", color: color(36, 76, 179)}
];
var colors = ["blue","yellow","black","red"];
var connections = [];

//arrays where things get added and spliced
var infDeck = [];
var infDisc = [];
var drawPile = [];
var drawPDisc = [];
var hand = [ [],[],[],[] ];
var position = [0,0,0,0];
var cubeCount = [24,24,24,24]; //blue, yellow, black, red
var roles2 = [];
var playerRoles = [];

var screen = 0;
var infCount = 0;
var outbreakCount = 0;

//more plans
/**
- every turn:
    - draw infection
    - add cubes to board
    - make actions
    - draw two from draw pile

- possible actions
    - moving along map
    - teleport by discard
    teleport by research station
    - treat
    - build research station (discard 1)
    - cure (discard 5)
    - special event cards
    - special role
*/

var drawSphere = function(x, sphereX, sphereY, diameter) {
    var cardW = diameter*3.9;
    var cardX = sphereX+cardW/3.5;
    var cardY = sphereY+cardW/3;
    
    //sphere
    fill(drawP[x].color);
    noStroke();
    ellipse(sphereX,sphereY,diameter,diameter);
            
    //sphere design
    strokeWeight(cardW/55);
    stroke(255,255,255,190);
    noFill();
    if (drawP[x].color === redC) {
        ellipse(sphereX,sphereY,cardW/6.75,cardW/6.75);
    } else if (drawP[x].color === blackC) {
        beginShape();
        vertex(sphereX,sphereY-cardW/13);
        vertex(sphereX+cardW/13,sphereY-cardW/35);
        vertex(sphereX+cardW/20,sphereY+cardW/15);
        vertex(sphereX-cardW/20,sphereY+cardW/15);
        vertex(sphereX-cardW/13,sphereY-cardW/35);
        vertex(sphereX,sphereY-cardW/13);
        endShape();
    } else if (drawP[x].color === blueC) {
        var toppest = sphereY - cardW/14;        
        var top = sphereY - cardW/38;
        var mid = sphereY - cardW/45;
        var middish = sphereY+cardW/92;
        var bot = sphereY + cardW/29;
        var bottest = sphereY + cardW/16;
        
        var leftest = sphereX - cardW/14.7;
        var lefter = sphereX - cardW/21.5;
        var left = sphereX - cardW/32;
        var leftish = sphereX - cardW/51;
        var center = sphereX;
        var rightish = -leftish + 2*sphereX;
        var right = -left + 2*sphereX;
        var righter = -lefter + 2*sphereX;
        var rightest = -leftest + 2*sphereX;
        
        beginShape();
        vertex(center,toppest);
        vertex(rightish,top);
        vertex(rightest,mid);
        vertex(right,middish);
        vertex(righter,bottest);
        vertex(center,bot);
        vertex(lefter, bottest);
        vertex(left,middish);
        vertex(leftest,mid);
        vertex(leftish,top);
        vertex(center,toppest);
        vertex(rightish,top);
        endShape();
    } else if (drawP[x].color === yellowC) {
        rect(sphereX,sphereY,cardW/9,cardW/9);
    }
        
    //sphere shine
    noFill();
    strokeWeight(cardW/70);
    stroke(255, 255, 255, 100);
    arc(sphereX,sphereY,cardW/5.0,cardW/4.9,190,254);
    
    //sphere shadow (with guess and check values)
    noStroke();
    fill(0,0,0,55);
    beginShape();
    vertex(sphereX+cardW/10.4,sphereY-cardW/11.0);
    bezierVertex(sphereX+cardW/4.4,sphereY+cardW/10.4,sphereX-cardW/26.6,sphereY+cardW/4.8,sphereX-cardW/8.7,sphereY+cardW/15.4);
    bezierVertex(cardX-cardW/5.3,cardY-cardW/4.8,cardX-cardW/5.4,cardY-cardW/2.5,sphereX+cardW/10.4,sphereY-cardW/11);
    endShape();
};
//for pure sphere purposes, 1-blue 2-yellow 3-black 4-red
var drawPlayer = function(role,x,y,s) {
    
    fill(roles[role].color);
    strokeWeight(1);
    stroke(0, 0, 0, 175);
    beginShape();
    vertex(x-s/4.0,y+s/2.3);
    bezierVertex(x-s/8,y+s/2,x+s/8,y+s/2,x+s/4,y+s/2.3);
    bezierVertex(x+s/4.5,y-s/4.0,x,y-s/11.5,x+s/8.0,y-s/3.9);
    bezierVertex(x+s/3.9,y-s/1.8,x-s/3.9,y-s/1.8,x-s/8.0,y-s/3.9);
    bezierVertex(x,y-s/11.5,x-s/4.5,y-s/4.0,x-s/4.0,y+s/2.3);
    endShape();
    
    stroke(255,255,255,130);
    strokeWeight(s/30);
    noFill();
    arc(x,y-s/3.3,s/5.9,s/3.8,191,256);
    arc(x,y+s/3.0,s/3.0,s/1.1,191,252);
};

//CARD DESIGN
var drawDrawP = function(x, cardX, cardY, cardW) {
    if (drawP[x].type === "city") {
        
        var cardBg = color(235, 217, 146);
        
        rectMode(CENTER);
        
        //black bg
        noStroke();
        fill(10, 10, 10);
        rect(cardX,cardY,cardW,cardW*7/5,cardW/7);
        
        //card bg
        noStroke();
        fill(cardBg);
        rect(cardX,cardY,cardW-cardW/385,cardW);
        
        //map and stuff
        fill(252,252,252);
        noStroke();
        rect(cardX,cardY+cardW/28,cardW,cardW/2.2);
        
        //white card outline
        strokeWeight(cardW/15);
        stroke(250, 250, 250);
        fill(0, 0, 0, 0);
        rect(cardX,cardY,cardW+cardW/17.5,cardW*7/5+cardW/17.5,cardW/7);
        
        //color card outline
        strokeWeight(cardW/35);
        stroke(drawP[x].color);
        fill(0, 0, 0, 0);
        rect(cardX,cardY,cardW,cardW*7/5,cardW/7);
        
        var cardContents = function() {
            //city name
            pushMatrix();
            fill(255,255,255);
            textFont(createFont("sans serif"),cardW/7);
            var w = textWidth(drawP[x].name);
            textAlign(LEFT,TOP);
            if (w < cardW/1.4) {
                text(drawP[x].name,cardX-cardW/2+cardW/8,cardY-cardW*7/10+cardW/30);
            } else {
                translate(cardX,cardY);
                scale(0.8,1);
                text(drawP[x].name,-cardW/2.0,-cardW*7/10+cardW/30);
            }
            popMatrix();
            
            drawSphere(x, cardX-cardW/3.25, cardY-cardW/3, cardW/3.9);
        };
        
        cardContents();
        pushMatrix();
        translate(cardX,cardY);
        rotate(180);
        translate(-cardX,-cardY);
        cardContents();
        popMatrix();
    }
    if (drawP[x].type === "spev") {}
    if (drawP[x].type === "epidemic") {}
};
var drawInf = function(x, cardX, cardY, cardW) {
    var cardBg = color(54, 128, 57);
    rectMode(CENTER);
    
    //black bg
    noStroke();
    fill(10, 10, 10);
    rect(cardX,cardY,cardW*7/5,cardW,cardW/7);
    
    //card bg
    noStroke();
    fill(cardBg);
    rect(cardX,cardY+cardW/6,cardW*7/5,cardW/1.4);
    
    //white card outline
    strokeWeight(cardW/15);
    stroke(0, 0, 0);
    fill(0, 0, 0, 0);
    rect(cardX,cardY,cardW*7/5+cardW/17.5,cardW+cardW/17.5,cardW/7);
        
    //color card outline
    strokeWeight(cardW/35);
    stroke(infDeck[x].color);
    fill(0, 0, 0, 0);
    rect(cardX,cardY,cardW*7/5,cardW,cardW/7);
    
    drawSphere(x,cardX-cardW/2.2,cardY-cardW/4.2,cardW/2.9);
    
    //city name
    
    pushMatrix();
    scale(0.7,1);
    fill(255, 246, 69);
    textSize(cardW/6.2);
    textAlign(LEFT,TOP);
    var city = infDeck[x].name.toUpperCase();
    var country = infDeck[x].country.toUpperCase();
    
    var w = textWidth(infDeck[x].name);
    if (w < cardW/0.78) {
        pushMatrix();
        scale(0.9,1);
        text(city,cardX+cardW/1.3,cardY-cardW/2.15);
        popMatrix();
    } else {
        text(city,cardX+cardW/2,cardY-cardW/2.15);
    }
    
    scale(1.6,1);
    fill(255,255,255);
    textSize(cardW/14);
    text(country,cardX-cardW/2.62,cardY-cardW/3.4);
    popMatrix();
    
};
var drawRoleCards = function(x, cardX, cardY, cardW) {
    pushMatrix();
    translate(cardX,cardY);
    rectMode(CENTER);
    
    fill(191, 191, 191);
    rect(0,-cardW/24.5,cardW*7/5,cardW/1.1);
    fill(roles[x].color,75);
    rect(0,-cardW/24.5,cardW*7/5,cardW/1.1);
    
    fill(roles[x].color);
    noStroke();
    rect(0,cardW/2.2,cardW*7/5,cardW/7.1);
    
    //white card outline
    strokeWeight(cardW/15);
    stroke(250, 250, 250);
    noFill();
    rect(0,0,cardW*7/5+cardW/17.5,cardW+cardW/17.5,cardW/7);
    
    //gray card outline
    strokeWeight(cardW/35);
    stroke(112, 112, 112);
    noFill();
    rect(0,0,cardW*7/5,cardW,cardW/7);
    
    //design
    stroke(roles[x].color);
    fill(185,185,185);
    rect(-cardW/5.0,cardW/15.4,cardW/1.8,cardW/1.8);
    drawPlayer(x, cardW/2.4,0,cardW/1.5);
    
    //name
    scale(0.75,1);
    fill(255, 255, 255);
    textSize(cardW/4.8);
    textAlign(LEFT);
    text(roles[x].name,-cardW/1.2,-cardW/3.6);
    popMatrix();
};

//CHIP DESIGN
var infChip = function(x,y,type) {
    var d = 20;
    pushMatrix();
    translate(x,y);
    
    //circle
    noStroke();
    if (type === "infection" || type === "outbreak") {
        fill(16, 110, 27);
    } else {
        fill(158, 42, 181);
    }
    ellipse(0,0,d,d);
    
    //green glow
    if (type === "infection" || type === "outbreak") {
        for (var i=0; i<100; i++) {
            noStroke();
            fill(16+i*(768/d),110+i*(768/d+1),27+i);
            ellipse(0,0,d*3/4-i*2,d*3/4-i*2);
            stroke(0,0,0);
            strokeWeight(1.3);
            noFill();
            ellipse(0,0,d/5,d/5);
        }
    }
    
    //design
    if (type === "outbreak") {
        //four arrows
        fill(0,0,0);
        var arrow = function() {
            beginShape();
            vertex(d/20.8,-d/11.3);
            vertex(d/8.6,-d/6.1);
            vertex(d/12.3,-d/5.2);
            vertex(d/5.1,-d/5.1);
            vertex(d/5.2,-d/11.1);
            vertex(d/6.1,-d/8.5);
            vertex(d/11.5,-d/26.1);
            endShape();
        };
        
        pushMatrix();
        for (var i=0; i<5; i++) {
            rotate(90*i);
            arrow();
        }
        popMatrix();
        
    } else if (type === "infection") {
        //three strange curve things
        var drawThing = function() {
            var x = 78.8;
            var y = 25.3;
            fill(23, 23, 23);
            beginShape();
            vertex(-d/x,-d/y);
            bezierVertex(-d/7.7,-d/13.4,-d/7.2,-d/5.6,-d/24.4,-d/4.2);
            bezierVertex(-d/6.7,-d/5.8,-d/7.7,-d/29.4,-d/34.7,-d/71.5);
            vertex(-d/x,-d/y);
            endShape();
        };
        
        pushMatrix();
        for (var i=0; i<3; i++) {
            rotate(120*i);
            drawThing();
            scale(-1,1);
            drawThing();
        }
        popMatrix();
        
    } else if (type === "eradicated") {
        //pink
        for (var i=0; i<100; i++) {
            noStroke();
            fill(255, 0, 115, 50);
            ellipse(0,0,d*2.4/4-i*2,d*2.4/4-i*2);
            fill(255,255,255,15);
            ellipse(0,0,d/2.0-i,d/2.0-i);
        }
        
        //yellow lines
        var drawYel = function() {
            noStroke();
            fill(245, 226, 12, 200);
            beginShape();
            vertex(-d/100,0);
            vertex(-d/14.8,-d/2.01);
            vertex(d/14.8,-d/2.01);
            vertex(d/100,0);
            endShape();
        };
        pushMatrix();
        for (var i=0; i<12; i++) {
            rotate(30);
            drawYel();
        }
        popMatrix();
        
        //the sun
        fill(255, 122, 20);
        ellipse(0,d/21,d/3.4,d/3.4);
        noStroke();
        for (var i=0; i<d/3.8; i++) {
            fill(255, 255, 31, 15);
            ellipse(0,d/23,i,i);
        }
        
        
        //ground
        noStroke();
        fill(130, 89, 44);
        var a = 2.08, b = 7.5;
        var c = 5.9, e = -60.8;
        var f = 2.9, g = 1.61;
        beginShape();
        vertex(-d/a,d/b);
        bezierVertex(-d/c,d/e,d/c,d/e,d/a,d/b);
        bezierVertex(d/f,d/g,-d/f,d/g,-d/a,d/b);
        endShape();
    }
    
    //inner circle
    stroke(0,0,0);
    strokeWeight(1);
    noFill();
    ellipse(0,0,d/1.25,d/1.25);
    
    //highlight
    strokeWeight(d/12);
    noFill();
    stroke(255,255,255,150);
    arc(0,0,d/1.25-3,d/1.25-3,116,233);
    stroke(255,255,255,100);
    arc(0,0,d/1.25+2,d/1.25+2,381,427);
    stroke(255,255,255,50);
    arc(0,0,d/1.25+2,d/1.25+2,318,343);
    
    popMatrix();
};
var cureChip = function(x,y,color) {
    var d = 20;
    pushMatrix();
    translate(x,y);
    
    noStroke();
    fill(252, 247, 237);
    ellipse(0,0,d,d);
    
    //glow
    for (var i=0; i<100; i++) {
        noStroke();
        fill(112, 112, 112, 20);
        ellipse(0,0,d/1.5-i*2,d/1.5-i*2);
    }
    
    //design
    stroke(0,0,0,150);
    fill(186, 233, 245);
    var y1 = -d/4.9;
    var y2 = -d/6.7;
    var y3 = d/4.4;
    var x1 = -d/5.6;
    var x2 = -d/10.4;
    beginShape();
        vertex(x2,y1);
        vertex(x1,y2);
        vertex(x1,y3);
        vertex(-x1,y3);
        vertex(-x1,y2);
        vertex(-x2,y1);
        vertex(x2,y1);
    endShape();
    
    fill(245, 245, 245);
    rectMode(CENTER);
    rect(0,-d/4.1,d/3.9,d/12.4,d/100);
    
    stroke(0,0,0,50);
    if (color === "blue") {
        fill(blueC);
    } else if (color === "red") {
        fill(redC);
    } else if (color === "yellow") {
        fill(yellowC);
    } else if (color === "black") {
        fill(blackC);
    }
    rect(0,d/35,d/3.3,d/3.4,d/20);
    noStroke();
    fill(255, 255, 255, 100);
    rect(-d/9.0,d/17.8,d/47,d/6.5);
    
    popMatrix();
};

//the one-time things we need to decide every game
var drawRoles = function() {
    for (var i=0; i<4; i++) {
        var r = round(random(0, roles2.length-1));
        playerRoles.push(roles2[r]);
        roles2.splice(r,1);
    }
};
var beginHand = function() {
    for (var i=0; i<4; i++) {
        var r1 = round(random(0,drawPile.length-3)); 
        //minus one+epidemics and spevs
        hand[i].push(drawPile[r1]);
        drawPile.splice(r1,1);
        var r2 = round(random(0,drawPile.length-3));
        hand[i].push(drawPile[r2]);
        drawPile.splice(r2,1);
    }
};
var drawMap = function() {
    var worldMap = function() {
    //the world map
    noStroke();
    fill(64, 89, 65);
    pushMatrix();
    translate(90,60);
    
    //the americas
    beginShape();
    vertex(121, 229);
    vertex(123, 263);
    vertex(102, 229);
    vertex(90, 183);
    vertex(96, 152);
    vertex(75, 134);
    vertex(49, 116);
    vertex(16, 65);
    vertex(1, 55);
    vertex(0, 33);
    vertex(29, 26);
    vertex(110, 20);
    vertex(132, 42);
    vertex(106, 104);
    vertex(78, 117);
    vertex(90, 133);
    vertex(105, 149);
    vertex(138, 152);
    vertex(164, 175);
    vertex(147, 203);
    endShape(CLOSE);
    popMatrix();
    
    //eurasia
    pushMatrix();
    translate(111,58);
    beginShape();
    vertex(236, 235);
    vertex(224, 235);
    vertex(204, 212);
    vertex(194, 183);
    vertex(166, 181);
    vertex(158, 153);
    vertex(202, 139);
    vertex(237, 133);
    vertex(237, 120);
    vertex(251, 111);
    vertex(224, 118);
    vertex(205, 115);
    vertex(177, 124);
    vertex(158, 120);
    vertex(178, 104);
    vertex(198, 78);
    vertex(220, 77);
    vertex(236, 68);
    vertex(228, 50);
    vertex(202, 69);
    vertex(196, 59);
    vertex(227, 29);
    vertex(306, 33);
    vertex(333, 39);
    vertex(368, 23);
    vertex(399, 24);
    vertex(399, 51);
    vertex(377, 76);
    vertex(354, 86);
    vertex(372, 101);
    vertex(366, 129);
    vertex(345, 149);
    vertex(339, 182);
    vertex(305, 164);
    vertex(290, 199);
    vertex(277, 176);
    vertex(271, 146);
    vertex(265, 172);
    vertex(250, 153);
    vertex(238, 179);
    endShape(CLOSE);
    
    beginShape();
    vertex(170, 101);
    vertex(156, 103);
    vertex(169, 93);
    vertex(170, 77);
    vertex(176, 84);
    endShape(CLOSE);
    
    //australia
    beginShape();
    vertex(360, 264);
    vertex(339, 250);
    vertex(324, 241);
    vertex(306, 247);
    vertex(294, 258);
    vertex(283, 244);
    vertex(291, 235);
    vertex(299, 227);
    vertex(299, 214);
    vertex(313, 210);
    vertex(326, 201);
    vertex(343, 205);
    vertex(363, 214);
    vertex(375, 222);
    vertex(380, 250);
    endShape(CLOSE);

    popMatrix();
};
    var connect = function(x,y) {
    stroke(255, 0, 0, 220);
    strokeWeight(2.3);
    line(drawP[x].xPos, drawP[x].yPos, drawP[y].xPos, drawP[y].yPos);
    connections.push(x + " + " + y);
};

    rectMode(CENTER);
    noStroke();
    fill(45, 48, 112);
    rect(300,200,420,280);
    
    worldMap();
    
    //draw decks (card backs)
    {
    fill(0, 217, 255, 50);
    rect(427,300,50,70,10);
    rect(371,300,50,70,10);
    fill(0, 0, 0, 80);
    rect(391,90,70,50,10);
    rect(465,90,70,50,10);
    }
    
    //role cards
    {
    drawRoleCards(playerRoles[0].number,131,30,50);
    drawRoleCards(playerRoles[1].number,469,30,50);
    drawRoleCards(playerRoles[2].number,131,370,50);
    drawRoleCards(playerRoles[3].number,469,370,50);
    }
    
    //CONNECTIONS
    {//atlanta
    connect(0,5); 
    connect(0,8);
    connect(0,17);
    //johannesburg
    connect(1,24); 
    connect(1,25);
    //istanbul
    connect(2,13); 
    connect(2,14);
    connect(2,26);
    connect(2,27);
    connect(2,28);
    connect(2,30);
    //hong kong
    connect(3,35); 
    connect(3,37);
    connect(3,40);
    connect(3,41);
    connect(3,43);
    connect(3,44);
    //blues
    connect(4,5); 
    connect(4,15);
    connect(5,6);
    connect(5,15);
    connect(5,16);
    connect(6,7);
    connect(6,8);
    connect(7,8);
    connect(7,9);
    connect(7,10);
    connect(8,17);
    connect(9,10);
    connect(9,11);
    connect(9,12);
    connect(10,11);
    connect(10,21);
    connect(10,26);
    connect(11,12);
    connect(11,13);
    connect(11,26);
    connect(12,13);
    connect(12,14);
    connect(14,28);
    //yellow
    connect(15,16);
    connect(16,17);
    connect(16,18);
    connect(16,19);
    connect(17,18);
    connect(18,19);
    connect(18,21);
    connect(18,22);
    connect(19,20);
    connect(21,22);
    connect(22,23);
    connect(23,24);
    connect(23,25);
    connect(24,25);
    connect(25,27);
    //black
    connect(26,27);
    connect(27,30);
    connect(27,31);
    connect(28,29);
    connect(29,30);
    connect(29,32);
    connect(29,34);
    connect(30,31);
    connect(30,32);
    connect(31,32);
    connect(32,33);
    connect(32,34);
    connect(33,34);
    connect(33,36);
    connect(34,35);
    connect(34,36);
    connect(35,36);
    connect(35,37);
    connect(36,37);
    connect(36,38);
    //red
    connect(37,38);
    connect(37,41);
    connect(38,41);
    connect(38,45);
    connect(39,40);
    connect(39,42);
    connect(40,42);
    connect(40,43);
    connect(40,46);
    connect(41,44);
    connect(42,46);
    connect(43,44);
    connect(43,47);
    connect(44,45);
    connect(46,47);} //normal connections
    {
    line(drawP[4].xPos,drawP[4].yPos,91,149); //sf to tokyo
    line(drawP[4].xPos,drawP[4].yPos,91,173); //sf to manila
    line(drawP[15].xPos,drawP[15].yPos,91,264); //la to sydney
    line(drawP[46].xPos,drawP[46].yPos,509,181); //tokyo to sf
    line(drawP[44].xPos,drawP[44].yPos,509,228); //manila to sf
    line(drawP[45].xPos,drawP[45].yPos,509,279); //sydney to la
    
    connections.push("4 + 46");
    connections.push("4 + 44");
    connections.push("15 + 45");
    } //cross-board connections
    
    //cities
    {
    textFont(createFont("sans serif"),7);
    textAlign(CENTER);
    var s = 13; //size
    for (var i=0; i<48; i++) {
        drawSphere(i,drawP[i].xPos,drawP[i].yPos,s);
        fill(255, 255, 255, 200);
        text(drawP[i].name,drawP[i].xPos,drawP[i].yPos+10);
    }
    }
    
    //infection counter
    {
    textSize(10);
    for (var i=-3; i<4; i++) {
        fill(0, 0, 0, 100);
        ellipse(426+i*22,141-i*i,20,20);
        fill(255, 255, 28, 180);
        var a;
        if (i<0) {
            a = 2;
        } else if (i<2) {
            a = 3;
        } else {
            a = 4;
        }
        text(a,426+i*22,161-i*i);
    }
    textSize(9);
    fill(255, 255, 28, 180);
    pushMatrix();
    scale(0.7,1);
    text("INFECTION RATE",602,128);
    popMatrix();
    }
    
    //outbreak counter: title
    {
    pushMatrix();
    scale(1,0.75);
    rotate(-90);
    text("OUTBREAKS",-282,105);
    stroke(187, 255, 0, 75);
    line(-244,107,-446,107);
    line(-243,99,-243,140);
    popMatrix();
    //outbreak counter: circles
    for (var i=0; i<9; i++) {
        fill(0,0,0,100);
        var a;
        if (i%2===0) {
            a = 120;
        } else {
            a = 137;
        }
        stroke(i*30, 200-i*30, 0);
        ellipse(a,196+i*16,20,20);
        fill(255, 255, 255,200);
        if (i<8) {
            text(i,a,199+i*16);
        } else {
            //death at 8
            noStroke();
            ellipse(a,194+i*16,7,7);
            stroke(255, 255, 255);
            line(a-4,202+i*16,a+4,198+i*16);
            line(a+4,202+i*16,a-4,198+i*16);
        }
    }
    }
    
    //cured diseases
    {
    textFont(createFont("sans serif"),8);
    fill(247, 224, 111,200);
    text("Cures Discovered",238,308);
    stroke(255, 0, 0);
    line(189,310,288,310);
    for (var i=0; i<4; i++) {
        drawSphere(i,189+i*33,325,20);
        stroke(255, 0, 0);
        line(189+i*33,310,189+i*33,314);
    }
    }
    
    //THE BRAND (tm)
    {
    pushMatrix();
    rotate(-7);
    textFont(createFont("fantasy"),32);
    fill(255, 255, 0, 50);
    text("PANDEMIC",153,127);
    fill(255, 0, 0, 175);
    text("PANDEMIC",154,128);
    fill(0, 0, 0);
    text("PANDEMIC",155,129);
    popMatrix();
    }
};

//call when necessary
var drawCubeDishes = function() {
     for (var i=0; i<4; i++) {
        pushMatrix();
        translate(208+i*60,30);
        fill(0, 0, 0,50);
        stroke(0,0,0,25);
        ellipse(0,0,50,50);
        if (i===0) {
            fill(blueC);
        } else if (i===1) {
            fill(yellowC);
        } else if (i===2) {
            fill(56, 56, 56);
        } else if (i===3) {
            fill(250, 47, 47);
        }
        for (var j=0; j<cubeCount[i]; j++) {
            rotate(random(0,360));
            rect(random(-15,15),random(-15,15),10,10);
        }
        popMatrix();
    }
};
var drawChips = function() {
    infChip(360+infCount*22,132+infCount*infCount,"infection");
    var a;
    if (outbreakCount%2===0) {
        var a = 120;
    } else {
        var a = 137;
    }
    infChip(a,196+outbreakCount*16,"outbreak");
    
    for (var i=0; i<4; i++) {
        //if cured, y = 310
        var y = 354;
        cureChip(189+i*33,y,colors[i]);
    }
};
var drawHands = function() {
    //bottom left
    for (var i=0; i<hand[0].length; i++) {
        drawDrawP(hand[0][i].number,45,255+21*i,65);
    }
    //bottom right
    for (var i=0; i<hand[1].length; i++) {
        drawDrawP(hand[1][i].number,554,255+21*i,65);
    }
    pushMatrix();
    translate(300,200);
    rotate(180);
    translate(-300,-200);
    //top right
    for (var i=0; i<hand[2].length; i++) {
        drawDrawP(hand[2][i].number,45,255+21*i,65);
    }
    //top left
    for (var i=0; i<hand[3].length; i++) {
        drawDrawP(hand[3][i].number,555,255+21*i,65);
    }
    popMatrix();

    
};

//moving players to places
var travel = function(player,place) {
    if (position[player] !== position[0] && position[player] !== position[1] && position[player] !== position[2]  && position[player] !== position[3] ) {
        drawPlayer(playerRoles[player].number,drawP[place].xPos,drawP[place].yPos,25);
    } else {
        drawPlayer(playerRoles[player].number,drawP[place].xPos+random(-10,10),drawP[place].yPos-8+random(1,10),25);
    }
    position[player] = place;
};

//screens
var startMenu = function() {
    background(206, 221, 224);
    textAlign(CENTER);
    textSize(50);
    fill(0, 0, 0, 40);
    text("PANDEMIC: THE GAME",303,103);
    fill(209, 19, 19);
    text("PANDEMIC: THE GAME",300,100);
    
    rectMode(CENTER);
    fill(227, 227, 227);
    rect(300,315,200,50);
    for (var i=0; i<50; i++) {
            noStroke();
            fill(0,0,0,i);
            rect(300,290+i,200,1);
        }
    
    if (mouseX>200 && mouseX<400 && mouseY>290 && mouseY<340) {
        for (var i=0; i<50; i++) {
            noStroke();
            fill(0,0,0,i*1.5);
            rect(300,290+i,200,1);
        }
        if (mouseIsPressed) {
            screen++;
        }
    }
    
    textSize(30);
    stroke(0, 0, 0);
    fill(0,0,0);
    text("Start",300,325);
};
var drawBoard = function() {
    background(187, 211, 230);
    
    //assigns number to drawP city cards, for mixing around
    for (var i=0; i<48; i++) {
        drawP[i].number = i;
    }
    
    //create drawPile and infDeck
    for (var i=0; i<drawP.length; i++) {
        drawPile.push(drawP[i]);
    }
    for (var i=0; i<48; i++) {
        infDeck.push(drawP[i]);
    }
    
    //make copy of roles array, give numbers
    for (var i=0; i<roles.length; i++) {
        roles[i].number = i;
        roles2.push(roles[i]);
    }
    
    //draw once
    drawRoles();
    beginHand();
    drawMap();
    
    //redraw if change
    drawCubeDishes();
    drawChips();
    drawHands();
    
    //infect cities (function not necessary bc this sequence only 
    for (var i=0; i<4; i++) {
        travel(i,0);
    }
    
    //draw research station at atlanta
    //determine who goes first (question who was sick last)
    screen++;
};
var gameplay = function() {
    drawChips();
    //background functions:
    //cube counter when hover
    //drawP card count when hover
    //role description when hover
    //current city + # of cubes on it when hover
    //closeup at hand when clicked
    
    //beginning a turn: draw two
    //four actions: show actions possible, choosing from selection screen
    //infect a city
        //case of outbreaks
    //move turn to next player
    //play special event cards at any time
    
    //case of epidemic drawn
    
    //case of eight cards in hand
    
    //when to show defeat screen
};
var defeat = function() {
    //defeat screen
};

draw = function() {
    size(500,500);
    if (screen === 0) {
        startMenu();
    } else if (screen === 1) {
        drawBoard();
    } //else if (screen === 2) {
        // gameplay();
    // } else if (screen === 4) {
        // defeat();
    //}
};
