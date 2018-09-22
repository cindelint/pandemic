/****** P A N D E M I C *****/
//ok you know what? finish it on ka before you try to transfer it ok
color redC = color(245, 106, 46);
color blueC = color(34, 132, 230);
color blackC = color(94, 94, 94);
color yellowC = color(250, 231, 23);

int screen = 0;
int outbreakCount = 0;


class Card {
    String name, country;
    color cardC;
    String type;
    int xPos, yPos;
    int number;
    Card(String name, String country, color cardC, String type, int xPos, int yPos) {
        this.name = name;
        this.country = country;
        this.cardC = cardC;
        this.type = type;
        this.xPos = xPos;
        this.yPos = yPos;
    }
}
class Role {
  String name;
  String info;
  color roleColor;
  int number;
  Role(String name, String info, color roleColor) {
    this.name = name;
    this.info = info;
    this.roleColor = roleColor;
  }
}

//arrays that dont change
Card[] drawP = new Card[] {
  new Card("Atlanta", "United States", blueC, "city", 175, 162),
  new Card("Johannesburg","South Africa", yellowC, "city", 320, 288),
  new Card("Istanbul", "Turkey", blackC, "city", 347, 181),
  new Card("Hong Kong", "China", redC, "city", 452, 197),
  new Card("San Francisco", "United States", blueC, "city", 124, 150),
  new Card("Chicago", "United States", blueC, "city", 154, 140),
  new Card("Toronto", "Canada", blueC, "city", 183, 131),
  new Card("New York", "United States", blueC, "city", 220, 136),
  new Card("Washington", "United States", blueC, "city", 215, 157),
  new Card("London", "Great Britain", blueC, "city", 283, 147),
  new Card("Madrid", "Spain", blueC, "city", 276, 179),
  new Card("Paris", "France", blueC, "city", 301, 166),
  new Card("Essen", "Germany", blueC, "city", 327, 141),
  new Card("Milan", "Italy", blueC, "city", 321, 179),
  new Card("St. Petersburg", "Russia", blueC, "city", 343, 111),
  new Card("Los Angeles", "United States", yellowC, "city", 144, 175),
  new Card("Mexico City", "Mexico", yellowC, "city", 177, 193),
  new Card("Miami", "United States", yellowC, "city", 211, 180),
  new Card("Bogota", "Columbia", yellowC, "city", 198, 222),
  new Card("Lima", "Peru", yellowC, "city", 183, 250),
  new Card("Santiago", "Chile", yellowC, "city", 188, 284),
  new Card("Sao Paulo", "Brazil", yellowC, "city", 240, 243),
  new Card("Buenos Aires", "Argentina", yellowC, "city", 226, 273),
  new Card("Lagos", "Nigeria", yellowC, "city", 298, 234),
  new Card("Kinshasa", "The Republic of Congo", yellowC, "city", 313, 256),
  new Card("Kartoum", "Sudan", yellowC, "city", 341, 248),
  new Card("Algiers", "Algeria", blackC, "city", 301, 204),
  new Card("Cairo", "Egypt", blackC, "city", 334, 204),
  new Card("Moscow", "Russia", blackC, "city", 372, 161),
  new Card("Tehran", "Iran", blackC, "city", 385, 179),
  new Card("Baghdad", "Iraq", blackC, "city", 368, 196),
  new Card("Riyadh", "Saudi Arabia", blackC, "city", 369, 222),
  new Card("Karachi", "Pakistan", blackC, "city", 389, 213),
  new Card("Mumbai", "India", blackC, "city", 392, 237),
  new Card("Delhi", "Delhi", blackC, "city", 402, 197),
  new Card("Kolkata", "India", blackC, "city", 422, 209),
  new Card("Chennai", "India", blackC, "city", 415, 226),
  new Card("Bangkok", "Thailand", redC, "city", 446, 223),
  new Card("Jakarta", "Indonesia", redC, "city", 429, 254),
  new Card("Beijing", "China", redC, "city", 461, 154),
  new Card("Shanghai", "China", redC, "city", 456, 177),
  new Card("Ho Chi Minh City", "Vietnam", redC, "city", 455, 240),
  new Card("Seoul", "South Korea", redC, "city", 485, 159),
  new Card("Taipei", "Taiwan", redC, "city", 477, 205),
  new Card("Manila", "The Phillipines", redC, "city", 493, 251),
  new Card("Sydney", "Australia", redC, "city", 480, 297),
  new Card("Tokyo", "Japan", redC, "city", 494, 190),
  new Card("Osaka", "Japan", redC, "city", 498, 212),
  // new Card("spev"),
  // new Card("epidemic")
};
Role[] roles = new Role[] {
  new Role("Troubleshooter", "1) At your turn's start, peek at the number of cards on top of the Infection Draw Pile equal to the current infection rate. 2) When performing a Direct Flight action, you reveal but do not discard the card.", color(227, 45, 70)),
  new Role("Medic", "1) Remove all cubes of a single color when you treat a city. 2) Administer known cures for free.", color(217, 163, 3)),
  new Role("Generalist", "You get 5 actions to spend each turn.", color(112, 112, 112)),
  new Role("Scientist", "You only need 4 cards of the same color to discover a cure.", color(235, 235, 235)),
  new Role("Researcher", "1) You may give a player cards from your hand for 1 action per card. 2) Both of your pawns must be in the same city, but it doesn't matter which city you are in.", color(168, 122, 49)),
  new Role("Field Operative", "1) Once per turn you may spend an action to move 1 cube from your current city to your Role Card. 2) You may Cure a Disease following normal rules but using only 3 cards plus 3 matching cubes from your Role Card.", color(247, 247, 40)),
  new Role("Operations Expert", "1) You may build a Research Station in your current city for one action. 2) Once per turn at a research station you may spend an action and discard any city card to move to any city.", color(65, 194, 58)),
  new Role("Dispatcher", "1) Move your fellow players' pawns on your turn as if they were your own. 2) Move any pawn to another city containing a pawn for 1 action.", color(186, 80, 184)),
  new Role("Archivist", "1) Your hand limit is 8 cards. 2) Once per turn, you may spend an action to draw your current city's card from the Player Discard Pile.", color(36, 76, 179))
};

String[] colors = new String[] {"blue","yellow","black","red"};
String[] connections = new String[250];

//arrays where things get added and spliced
Card[] infDeck = new Card[48];
Card[] infDisc = new Card[48];
Card[] drawPile = new Card[700];
Card[] drawPDisc = new Card[700];
Object[] hand = new Object[] { new int[7], new int[7], new int[7], new int[7] };
int[] position = {0,0,0,0};
int[] cubeCount = {24,24,24,24}; //blue, yellow, black, red
Role[] roles2 = new Role[9];
Role[] playerRoles = new Role[4];


void drawSphere(int x, float sphereX, float sphereY, float diameter) {
    float cardW = diameter*3.9;
    float cardX = sphereX+cardW/3.5;
    float cardY = sphereY+cardW/3;

    //sphere
    fill(drawP[x].cardC);
    noStroke();
    ellipse(sphereX,sphereY,diameter,diameter);


    //sphere design
    strokeWeight(cardW/55);
    stroke(255,255,255,190);
    noFill();
    if (drawP[x].cardC == redC) {
        ellipse(sphereX,sphereY,cardW/6.75,cardW/6.75);
    } else if (drawP[x].cardC == blackC) {
        beginShape();
        vertex(sphereX,sphereY-cardW/13);
        vertex(sphereX+cardW/13,sphereY-cardW/35);
        vertex(sphereX+cardW/20,sphereY+cardW/15);
        vertex(sphereX-cardW/20,sphereY+cardW/15);
        vertex(sphereX-cardW/13,sphereY-cardW/35);
        vertex(sphereX,sphereY-cardW/13);
        endShape();
    } else if (drawP[x].cardC == blueC) {
        float toppest = sphereY - cardW/14;
        float top = sphereY - cardW/38;
        float mid = sphereY - cardW/45;
        float middish = sphereY+cardW/92;
        float bot = sphereY + cardW/29;
        float bottest = sphereY + cardW/16;

        float leftest = sphereX - cardW/14.7;
        float lefter = sphereX - cardW/21.5;
        float left = sphereX - cardW/32;
        float leftish = sphereX - cardW/51;
        float center = sphereX;
        float rightish = -leftish + 2*sphereX;
        float right = -left + 2*sphereX;
        float righter = -lefter + 2*sphereX;
        float rightest = -leftest + 2*sphereX;

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
    } else if (drawP[x].cardC == yellowC) {
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
}

//for pure sphere purposes, 1-blue 2-yellow 3-black 4-red
void drawPlayer(int role, float x, float y, float s) {

    fill(roles[role].roleColor);
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
}

//CARD DESIGN
void cardContents(int cx, float cX, float cY, float cW) {
    //city name
    pushMatrix();
    fill(255,255,255);
    textFont(createFont("sans serif",cW/7));
    float w = textWidth(drawP[cx].name);
    textAlign(LEFT,TOP);
    if (w < cW/1.4) {
        text(drawP[cx].name,cX-cW/2+cW/8,cY-cW*7/10+cW/30);
    } else {
        translate(cX,cY);
        scale(0.8,1);
        text(drawP[cx].name,-cW/2.0,-cW*7/10+cW/30);
    }
    popMatrix();

    drawSphere(cx, cX-cW/3.25, cY-cW/3, cW/3.9);
}
void drawDrawP(int x, float cardX, float cardY, float cardW) {
    if (drawP[x].type == "city") {

        color cardBg = color(235, 217, 146);

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
        stroke(drawP[x].cardC);
        fill(0, 0, 0, 0);
        rect(cardX,cardY,cardW,cardW*7/5,cardW/7);

        cardContents(x, cardX, cardY, cardW);
        pushMatrix();
        translate(cardX,cardY);
        rotate(180);
        translate(-cardX,-cardY);
        cardContents(x, cardX, cardY, cardW);
        popMatrix();
    }
    if (drawP[x].type == "spev") {}
    if (drawP[x].type == "epidemic") {}
}
/* void drawInf(int x, float cardX, float cardY, float cardW) {
    color cardBg = color(54, 128, 57);
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
    stroke(infDeck[x].cardC);
    fill(0, 0, 0, 0);
    rect(cardX,cardY,cardW*7/5,cardW,cardW/7);

    drawSphere(x,cardX-cardW/2.2,cardY-cardW/4.2,cardW/2.9);

    //city name

    pushMatrix();
    scale(0.7,1);
    fill(255, 246, 69);
    textSize(cardW/6.2);
    textAlign(LEFT,TOP);
    String city = infDeck[x].name.toUpperCase();
    String country = infDeck[x].country.toUpperCase();

    float w = textWidth(infDeck[x].name);
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
}
void drawRoleCards(int x, float cardX, float cardY, float cardW) {
    pushMatrix();
    translate(cardX,cardY);
    rectMode(CENTER);

    fill(191, 191, 191);
    rect(0,-cardW/24.5,cardW*7/5,cardW/1.1);
    fill(roles[x].roleColor,75);
    rect(0,-cardW/24.5,cardW*7/5,cardW/1.1);

    fill(roles[x].roleColor);
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
    stroke(roles[x].roleColor);
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
} */

//CHIP DESIGN
void drawArrow(float chipD) {
    beginShape();
    vertex(chipD/20.8,-chipD/11.3);
    vertex(chipD/8.6,-chipD/6.1);
    vertex(chipD/12.3,-chipD/5.2);
    vertex(chipD/5.1,-chipD/5.1);
    vertex(chipD/5.2,-chipD/11.1);
    vertex(chipD/6.1,-chipD/8.5);
    vertex(chipD/11.5,-chipD/26.1);
    endShape();
}; //outbreak counter: arrows
void drawInfThing(float chipD) {
    float x = 78.8;
    float y = 25.3;
    fill(23, 23, 23);
    beginShape();
    vertex(-chipD/x,-chipD/y);
    bezierVertex(-chipD/7.7,-chipD/13.4,-chipD/7.2,-chipD/5.6,-chipD/24.4,-chipD/4.2);
    bezierVertex(-chipD/6.7,-chipD/5.8,-chipD/7.7,-chipD/29.4,-chipD/34.7,-chipD/71.5);
    vertex(-chipD/x,-chipD/y);
    endShape();
}; //infection counter: strange curved things
void drawYel(float chipD) {
     noStroke();
     fill(245, 226, 12, 200);
     beginShape();
     vertex(-chipD/100,0);
     vertex(-chipD/14.8,-chipD/2.01);
     vertex(chipD/14.8,-chipD/2.01);
     vertex(chipD/100,0);
     endShape();
}; //eradicated diseases: the yellow lines
void infChip(float x, float y, String type) {
    int d = 20;
    pushMatrix();
    translate(x,y);

    //circle
    noStroke();
    if (type == "infection" || type == "outbreak") {
        fill(16, 110, 27);
    } else {
        fill(158, 42, 181);
    }
    ellipse(0,0,d,d);

    //green glow
    if (type == "infection" || type == "outbreak") {
        for (int i=0; i<100; i++) {
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
    if (type == "outbreak") {
        //four arrows
        fill(0,0,0);
        pushMatrix();
        for (int i=0; i<5; i++) {
            rotate(90*i);
            drawArrow(d);
        }
        popMatrix();

    } else if (type == "infection") {
        pushMatrix();
        for (int i=0; i<3; i++) {
            rotate(120*i);
            drawInfThing(d);
            scale(-1,1);
            drawInfThing(d);
        }
        popMatrix();

    } else if (type == "eradicated") {
        //pink
        for (int i=0; i<100; i++) {
            noStroke();
            fill(255, 0, 115, 50);
            ellipse(0,0,d*2.4/4-i*2,d*2.4/4-i*2);
            fill(255,255,255,15);
            ellipse(0,0,d/2.0-i,d/2.0-i);
        }

        //yellow lines
        pushMatrix();
        for (int i=0; i<12; i++) {
            rotate(30);
            drawYel(d);
        }
        popMatrix();

        //the sun
        fill(255, 122, 20);
        ellipse(0,d/21,d/3.4,d/3.4);
        noStroke();
        for (int i=0; i<d/3.8; i++) {
            fill(255, 255, 31, 15);
            ellipse(0,d/23,i,i);
        }

        //ground
        noStroke();
        fill(130, 89, 44);
        float a = 2.08, b = 7.5;
        float c = 5.9, e = -60.8;
        float f = 2.9, g = 1.61;
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
}
void cureChip(float x, float y, String c) {
    int d = 20;
    pushMatrix();
    translate(x,y);

    noStroke();
    fill(252, 247, 237);
    ellipse(0,0,d,d);

    //glow
    for (int i=0; i<100; i++) {
        noStroke();
        fill(112, 112, 112, 20);
        ellipse(0,0,d/1.5-i*2,d/1.5-i*2);
    }

    //design
    stroke(0,0,0,150);
    fill(186, 233, 245);
    float y1 = -d/4.9;
    float y2 = -d/6.7;
    float y3 = d/4.4;
    float x1 = -d/5.6;
    float x2 = -d/10.4;
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
    if (c == "blue") {
        fill(blueC);
    } else if (c == "red") {
        fill(redC);
    } else if (c == "yellow") {
        fill(yellowC);
    } else if (c == "black") {
        fill(blackC);
    }
    rect(0,d/35,d/3.3,d/3.4,d/20);
    noStroke();
    fill(255, 255, 255, 100);
    rect(-d/9.0,d/17.8,d/47,d/6.5);

    popMatrix();
}

//the one-time things we need to decide every game
/* void drawRoles() {
    for (int i=0; i<4; i++) {
        int r = round(random(0, roles2.length-1));
        playerRoles[playerRoles.length] = roles2[r];
        roles2.splice(r,1);
    }
}
void beginHand() {
    for (int i=0; i<4; i++) {
        int r1 = round(random(0,drawPile.length-3));
        //minus one+epidemics and spevs
        hand[i].push(drawPile[r1]);
        drawPile.splice(r1,1);
        int r2 = round(random(0,drawPile.length-3));
        hand[i].push(drawPile[r2]);
        drawPile.splice(r2,1);
    }
} */

void worldMap() {
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
void connect(int x, int y) {
  stroke(255, 0, 0, 220);
  strokeWeight(2.3);
  line(drawP[x].xPos, drawP[x].yPos, drawP[y].xPos, drawP[y].yPos);
  // connections[connections.length] = x + " + " + y;
};
void drawMap() {
  rectMode(CENTER);
  noStroke();
  fill(45, 48, 112);
  rect(300,200,420,280);

  worldMap();

  //draw decks (card backs)
  fill(0, 217, 255, 50);
  rect(427,300,50,70,10);
  rect(371,300,50,70,10);
  fill(0, 0, 0, 80);
  rect(391,90,70,50,10);
  rect(465,90,70,50,10);

  //role cards
  /* drawRoleCards(playerRoles[0].number,131,30,50);
  drawRoleCards(playerRoles[1].number,469,30,50);
  drawRoleCards(playerRoles[2].number,131,370,50);
  drawRoleCards(playerRoles[3].number,469,370,50); */

  //CONNECTIONS
  //atlanta
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
  connect(46,47);

   //cross-board connections
  line(drawP[4].xPos,drawP[4].yPos,91,149); //sf to tokyo
  line(drawP[4].xPos,drawP[4].yPos,91,173); //sf to manila
  line(drawP[15].xPos,drawP[15].yPos,91,264); //la to sydney
  line(drawP[46].xPos,drawP[46].yPos,509,181); //tokyo to sf
  line(drawP[44].xPos,drawP[44].yPos,509,228); //manila to sf
  line(drawP[45].xPos,drawP[45].yPos,509,279); //sydney to la

  // connections[connections.length] = "4 + 46";
  // connections[connections.length] = "4 + 44";
  // connections[connections.length] = "15 + 45";

  //cities
  textFont(createFont("sans serif",7));
  textAlign(CENTER);
  int s = 13; //size
  for (int i=0; i<48; i++) {
      drawSphere(i,drawP[i].xPos,drawP[i].yPos,s);
      fill(255, 255, 255, 200);
      text(drawP[i].name,drawP[i].xPos,drawP[i].yPos+10);
  }

  //infection counter
  textSize(10);
  for (int i=-3; i<4; i++) {
      fill(0, 0, 0, 100);
      ellipse(426+i*22,141-i*i,20,20);
      fill(255, 255, 28, 180);
      int a;
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

  //outbreak counter: title
  pushMatrix();
  scale(1,0.75);
  rotate(-90);
  text("OUTBREAKS",-282,105);
  stroke(187, 255, 0, 75);
  line(-244,107,-446,107);
  line(-243,99,-243,140);
  popMatrix();
  //outbreak counter: circles
  for (int i=0; i<9; i++) {
      fill(0,0,0,100);
      int a;
      if (i%2==0) {
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

  //cured diseases
  textFont(createFont("sans serif",8));
  fill(247, 224, 111,200);
  text("Cures Discovered",238,308);
  stroke(255, 0, 0);
  line(189,310,288,310);
  for (int i=0; i<4; i++) {
      drawSphere(i,189+i*33,325,20);
      stroke(255, 0, 0);
      line(189+i*33,310,189+i*33,314);
  }

  //THE BRAND (tm)
  pushMatrix();
  rotate(-7);
  textFont(createFont("fantasy",32));
  fill(255, 255, 0, 50);
  text("PANDEMIC",153,127);
  fill(255, 0, 0, 175);
  text("PANDEMIC",154,128);
  fill(0, 0, 0);
  text("PANDEMIC",155,129);
  popMatrix();
}

//call when necessary
/*
void drawCubeDishes() {
     for (int i=0; i<4; i++) {
        pushMatrix();
        translate(208+i*60,30);
        fill(0, 0, 0,50);
        stroke(0,0,0,25);
        ellipse(0,0,50,50);
        if (i==0) {
            fill(blueC);
        } else if (i==1) {
            fill(yellowC);
        } else if (i==2) {
            fill(56, 56, 56);
        } else if (i==3) {
            fill(250, 47, 47);
        }
        for (int j=0; j<cubeCount[i]; j++) {
            rotate(random(0,360));
            rect(random(-15,15),random(-15,15),10,10);
        }
        popMatrix();
    }
}
void drawChips() {
    infChip(360+infCount*22,132+infCount*infCount,"infection");
    int a;
    if (outbreakCount%2==0) {
        a = 120;
    } else {
        a = 137;
    }
    infChip(a,196+outbreakCount*16,"outbreak");

    for (int i=0; i<4; i++) {
        //if cured, y = 310
        int y = 354;
        cureChip(189+i*33,y,colors[i]);
    }
}
void drawHands() {
    //bottom left
    for (int i=0; i<hand[0].length; i++) {
        drawDrawP(hand[0][i].number,45,255+21*i,65);
    }
    //bottom right
    for (int i=0; i<hand[1].length; i++) {
        drawDrawP(hand[1][i].number,554,255+21*i,65);
    }
    pushMatrix();
    translate(300,200);
    rotate(180);
    translate(-300,-200);
    //top right
    for (int i=0; i<hand[2].length; i++) {
        drawDrawP(hand[2][i].number,45,255+21*i,65);
    }
    //top left
    for (int i=0; i<hand[3].length; i++) {
        drawDrawP(hand[3][i].number,555,255+21*i,65);
    }
    popMatrix();
}

//moving players to places
void travel(int player, int place) {
    if (position[player] != position[0] && position[player] != position[1] && position[player] != position[2]  && position[player] != position[3] ) {
        drawPlayer(playerRoles[player].number,drawP[place].xPos,drawP[place].yPos,25);
    } else {
        drawPlayer(playerRoles[player].number,drawP[place].xPos+random(-10,10),drawP[place].yPos-8+random(1,10),25);
    }
    position[player] = place;
} */

//screens
void startMenu() {
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
    for (int i=0; i<50; i++) {
            noStroke();
            fill(0,0,0,i);
            rect(300,290+i,200,1);
        }

    if (mouseX>200 && mouseX<400 && mouseY>290 && mouseY<340) {
        for (int i=0; i<50; i++) {
            noStroke();
            fill(0,0,0,i*1.5);
            rect(300,290+i,200,1);
        }
        if (mousePressed) {
            screen++;
        }
    }

    textSize(30);
    stroke(0, 0, 0);
    fill(0,0,0);
    text("Start",300,325);
}
void drawBoard() {
    background(187, 211, 230);

    //assigns number to drawP city cards, for mixing around
    for (int i=0; i<48; i++) {
        drawP[i].number = i;
    }

    //create drawPile and infDeck
    for (int i=0; i<drawP.length; i++) {
        // drawPile[drawPile.length] = drawP[i];
    }
    for (int i=0; i<48; i++) {
        // infDeck[infDeck.length] = drawP[i];
    }

    //make copy of roles array, give numbers
    for (int i=0; i<roles.length; i++) {
        roles[i].number = i;
        // roles2[roles2.length] = roles[i];
    }

    //draw once
    // drawRoles();
    // beginHand();
    drawMap();

    //redraw if change
    // drawCubeDishes();
    // drawChips();
    // drawHands();

    //infect cities (function not necessary bc this sequence only
    for (int i=0; i<4; i++) {
        // travel(i,0);
    }

    //draw research station at atlanta
    //determine who goes first (question who was sick last)
    screen++;
}
void gameplay() {
    //drawChips();
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
}
void defeat() {
    //defeat screen
}

void setup() {
  size(600,400);
}

void draw() {
    if (screen == 0) {
        startMenu();
    } else if (screen == 1) {
        drawBoard();
    } //else if (screen == 2) {
        // gameplay();
    // } else if (screen == 4) {
        // defeat();
    //}
}
