//********************************** 
//  POSITION GLOBAL VARIABLES FOR THE LOOK OF THE EDITOR
//  interface grid for element location
//**********************************
int cols = 25;
int rows = 25;
float [] gridRow = new float [rows];
float [] gridCols = new float [cols];
float W, H;
PImage logo;//, jogWheel ; 
float spaceBetw;
//**********************************
/// THE AMBIENT VARIABLES
//***********************************
PFont f;
int fontDimension=10;
int rW = 60;
int rH = 60;
int rR = 30;

void settingScreen() {

  W=width/rows;
  H=height/cols;

  for (int i = 0; i < cols; i++) {
    gridCols[i] = W*i ;
    // println("i: "+ gridCols[i]);
  }
  for (int j = 0; j < rows; j++) {
    gridRow[j] =  H*j ;
    // println("j: "+ gridRow[j]);
  }
  spaceBetw =  gridCols[1]+rW/3;
}
// *****************************************
//           the background look
//******************************************

void interfaceDisp() {
  // Background
  background(16, 50);
  // box for Setting Label
  stroke(64);
  fill(32, 180);
  rect((int)gridCols[18]+1, (int) gridCols[0]+20, (int)gridCols[5]-2, spaceBetw/3);
  // box for sis button
  stroke(64);
  fill(32, 180);
  rect(gridCols[3]-rW/10, gridRow[2]-rW/4, spaceBetw*9-15, spaceBetw-25);
  // the info box down design
  stroke(100);
  //fill(109, 136, 163);
  rect(gridCols[3]-rW/10, gridRow[19]+spaceBetw, spaceBetw*9-15, spaceBetw);
  // box for Settings elements
  stroke(64);
  fill(64, 180);
  rect((int)gridCols[18]+1, (int) gridCols[2]+25, (int)gridCols[5]-2, gridCols[9]+30);
  // separators for multiplexer
  //for (int i=0; i<5; i++) {
  //  stroke (64);
  //  strokeWeight(3);
  //  line(gridCols[5]+rW/16+(i)* (1.6*spaceBetw), gridRow[8]+spaceBetw/2, gridCols[5]+rW/16+(i)* (1.6*spaceBetw), gridRow[12]+spaceBetw/2);
  //}
}
void midiMonitor() {
  // background
  noStroke();
  fill(32, 32, 32);
  strokeWeight(2);
  stroke(200);  
  rect((int)gridCols[18]+1, (int) gridCols[12]+25, (int)gridCols[5]-2, spaceBetw*1.8); //red out
  //noStroke();
  noFill();
  strokeWeight(2);
  stroke(128);  
  rect((int)gridCols[18]+1, (int) gridCols[12]+25, (int)gridCols[5]-2, spaceBetw*1.8-2);// red in

  fill(0, 255, 0);
  textSize(12);
  text("Channel: "+ Channel, gridCols[18]+10, (int) gridCols[12]+10+H);
  text("Type: "+ optCC, gridCols[18]+10, (int) gridCols[12]+35+H);
  text("Value 1: "+Note, gridCols[18]+10, (int) gridCols[13]+10+H);
  text("Value 2: "+Intensity, gridCols[18]+10, (int) gridCols[13]+35+H);
}
void explanationText() {
  if (infoGraph<48) {
    // generic
    text("nd ", 
      gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<49) {
    //switch
    text("The page-switch can send note or cc messages \n recorded into the 1st page preset only.", 
      gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<50) {
    //mouse
    text("MOUSE: Maxvalue = 0 - no mouse - no keys emulation\n"+
      "Maxvalue = 1 to activate mouse emulation, via joystick.\n"+
      "Maxvalue = 2 to activate arrow direction keys emulation, via joystick.\n"+
      "Value    = 1 to activate mouse Wheel emulation, via Side-Spinner.", 
      gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2002) {
    text("Midi event type: Note, Poly-AT, Control-Change, Program-Change, Channel-AT and Pitch-Bend messages", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2003) {
    text("Value of the note", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2004) {
    text("Min Value", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2005) {
    text("Max Value", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2006) {
    text("Midi Channel", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2007) {
    text("Address DMX", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2008) {
    text("POT = Continuous output, use this setup for potenciometers and sensors.\n"+
      "BUTTON = debounced on-off output. Use it for Pushbuttons.\n"+
      "TOGGLE = debounced Toggle mode.\n"+
      "TOGGLE GROUPS = Only a single button can be ON at a time, for it's specified group.", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2010) {
    text("MODIFIERS:\n"+ 
      "if QWERTY keys emulation is active, it's possible to add MODIFIERS and combinations of them.\n"+
      "So, it's possible to emulate complex QWERTY keystrokes on a single button.", gridCols[3], gridRow[19]+spaceBetw+18);
  } else if (infoGraph<2011) {
    text("KEYS: QWERTY keyboard emulation.\n"+
      "list of ASCII keys.\n"+
      "MIDI data will not be output in QWERTY key mode, choose NULL to have midi output.", gridCols[3], gridRow[19]+spaceBetw+18);
  }
}