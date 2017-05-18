void firstPosition() {
  //myKnob(PApplet applet, String label_, int posx_, int posy_, int rW, int rH, int r_)
  for (int i=0; i<4; i++) {
    elementData.add( new myUI(this, cp5, Integer.toString( memPosLUT[i]), memPosLUT[i], i, gridCols[3]+i*(spaceBetw/3+rW/12), gridRow[10], rW/3, rH/3, 2));
  }
  for (int i=4; i<8; i++) {
    elementData.add(new myUI(this, cp5, Integer.toString (memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-4)*(spaceBetw/3+rW/12), gridRow[10]+spaceBetw/2, rW/3, rH/3, 2));
  }
  for (int i=8; i<12; i++) {
    elementData.add( new myUI(this, cp5, Integer.toString( memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-4)*(spaceBetw/3+rW/12), gridRow[10], rW/3, rH/3, 1));
  }
  for (int i=12; i<16; i++) {
    elementData.add(new myUI(this, cp5, Integer.toString (memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-8)*(spaceBetw/3+rW/12), gridRow[10]+spaceBetw/2, rW/3, rH/3, 1));
  }
  for (int i=16; i<20; i++) {
    elementData.add( new myUI(this, cp5, Integer.toString( memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-8)*(spaceBetw/3+rW/12), gridRow[10], rW/3, rH/3, 2));
  }
  for (int i=20; i<24; i++) {
    elementData.add(new myUI(this, cp5, Integer.toString (memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-12)* (spaceBetw/3+rW/12), gridRow[10]+spaceBetw/2, rW/3, rH/3, 2));
  }
  for (int i=24; i<28; i++) {
    elementData.add( new myUI(this, cp5, Integer.toString( memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-12)* (spaceBetw/3+rW/12), gridRow[10], rW/3, rH/3, 1));
  }
  for (int i=28; i<32; i++) {
    elementData.add(new myUI(this, cp5, Integer.toString (memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-16)* (spaceBetw/3+rW/12), gridRow[10]+spaceBetw/2, rW/3, rH/3, 1));
  }
  for (int i=32; i<36; i++) {
    elementData.add( new myUI(this, cp5, Integer.toString( memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-16)* (spaceBetw/3+rW/12), gridRow[10], rW/3, rH/3, 2));
  }
  for (int i=36; i<40; i++) {
    elementData.add(new myUI(this, cp5, Integer.toString (memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-20)* (spaceBetw/3+rW/12), gridRow[10]+spaceBetw/2, rW/3, rH/3, 2));
  }
  for (int i=40; i<44; i++) {
    elementData.add( new myUI(this, cp5, Integer.toString( memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-20)* (spaceBetw/3+rW/12), gridRow[10], rW/3, rH/3, 1));
  }
  for (int i=44; i<48; i++) {
    elementData.add(new myUI(this, cp5, Integer.toString (memPosLUT[i]), memPosLUT[i], i, gridCols[3]+(i-24)* (spaceBetw/3+rW/12), gridRow[10]+spaceBetw/2, rW/3, rH/3, 1));
  }

  elementData.add(new myUI(this, cp5, "Switch", memPosLUT[48], 48, gridCols[3]+5*spaceBetw+rW/2, gridRow[9]+spaceBetw+2*rH, rW*11/12+rW/2, rH/2, 0));
  elementData.add(new myUI(this, cp5, "Mouse", memPosLUT[49], 49, gridCols[3]+2*spaceBetw+8, gridRow[9]+spaceBetw+2*rH, rW*11/12+rW/2, rH/2, 0));
}
// THE BUTTON POSITION AND POLYMORFISM in ElementPosition class//
void setupElement () {
  firstPosition();
}