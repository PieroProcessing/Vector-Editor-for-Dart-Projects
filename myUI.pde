//THE CLASS OBJ of the Element of the DART
ArrayList <myUI> elementData = new ArrayList <myUI>();
ControlP5 cp5;

class myUI {
  //**************************  Data
  int note;
  int memoryPosition;
  boolean noteControll;
  int setExcursionControllMin;
  int setExcursionControllMax;
  int midiChannel;
  int addressDMX;
  // toggle buttons
  int toggleMode;
  boolean noteCC;
  boolean togglePage;
  int indexMidiType;
  int keyBoard;
  int modifiers;
  //***************************  Settings
  String label;
  String temp;
  float posX;
  float posY;
  int radiusW;
  int radiusH;
  // dimension of the numberbox
  int boxX=40;
  int boxY=18;

  /////////// instances of default class
  ControlP5 sett;
  //****************************** the button data

  boolean stateButton;

  //int [] typeMidiArray={144, 160, 176, 192, 208, 224};
  //******************************  
  //  for menus
  //****************************** 
  Numberbox mp, nT, min, max, midiC, dmx;
  ScrollableList dMode, midiTypeOpt, dKeys, dModif;


  String [] keyboardList = {"null", "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10", "f11", 
    "f12", "right arrow", "left arrow", "down arrow", "up arrow", "left ctrl", "left shift", 
    "left alt", "backspace", "return", "esc", "delete", 
    "space", "!", "\"", "#", "$", "%", "&", "\'", "(", ")", "*", 
    "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", 
    "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", 
    "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", 
    "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", 
    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", 
    "x", "y", "z", "{", "|", "}", "~", 
    "mouse left", "mouse right", "mouse center"
  };
  String [] modifiersList = {"None", "ctrl", "shift", "alt", "ctrl+shift", "ctrl + alt"
  };

  myUI (PApplet applet, ControlP5 cp5_, String label_, int mem_pos, int id_, float posx_, float posy_, int rW, int rH, int setView_) {
    label = label_;
    memoryPosition = mem_pos;
    posX = posx_;
    posY = posy_;
    radiusW = rW;
    radiusH = rH;

    sett = new ControlP5(applet);
    sett.setFont(f, fontDimension);
    settingsBox();

    switch(setView_) {
    case 0:
      cp5_.addButton(label)
        .setId(id_)
        .setPosition(posX, posY)
        .setSize(radiusW, radiusH)
        .setView(new RectButton())
        ;
      break;
    case 1:
      cp5_.addButton(label)
        .setId(id_)
        .setPosition(posX, posY)
        .setSize(radiusW, radiusH)
        .setView(new Marrone());
      break;
    case 2:
      cp5_.addButton(label)
        .setId(id_)
        .setPosition(posX, posY)
        .setSize(radiusW, radiusH)
        .setView(new Grigio());
      break;
    case 3:
      cp5_.addButton(label)
        .setId(id_)
        .setPosition(posX, posY)
        .setSize(radiusW, radiusH)
        ;
      break;
    }
  }
  boolean getStateButton () {
    return stateButton;
  }
  void setStateButton (boolean b) {
    stateButton = b;
  }
  ////////////// THE BOX SETTING DESIGN AND TOGGLE///////////////////////

  void setDisplay (boolean b) {
    sett.setVisible(b); // to set visibility of box settings on
  }
  boolean getStateDisplay() {
    //println("sett is visible: " +  sett.isVisible());
    return sett.isVisible();
  }

  /// THE BOX SETTINGS PARAMETERS TO SET DART//
  void settingsBox() {

    midiTypeOpt = sett.addScrollableList("midiTypeOpt")
      .plugTo(this, "midiTypeOpt" )
      .setPosition(gridCols[18]+5, gridRow[4])
      .setSize(170, 250)
      .setColorBackground(ControlP5.BLACK)
      .setBarHeight(28)
      .setItemHeight(30)
      .setOpen(false)
      .onEnter(toFront)
      .onLeave(close)
      .setType(ControlP5.DROPDOWN)
      .setLabel("Midi Type")
      .setId(2001)
      .addItems(typeMidiList)
      ;
    nT = sett.addNumberbox("note", (int) gridCols[18]+5, (int)gridRow[6], boxX, boxY)
      .plugTo( this, "note" )
      .setId(2002)
      .setColorBackground(ControlP5.BLACK)
      .setRange(0, 127)
      .setLabel("Value")
      ;
    min = sett.addNumberbox("setExcursionControllMin", (int)gridCols[18]+5, (int)gridRow[8], boxX, boxY)
      .plugTo( this, "setExcursionControllMin" )
      .setId(2003)
      .setColorBackground(ControlP5.BLACK)
      .setLabel("Minimum Value")
      .setRange(0, 127);
    max = sett.addNumberbox("setExcursionControllMax", (int)gridCols[18]+5, (int)gridRow[10], boxX, boxY)
      .plugTo( this, "setExcursionControllMax" )
      .setId(2004)
      .setColorBackground(ControlP5.BLACK)
      .setValue(127)
      .setLabel("Maximum Value")
      .setRange(0, 127)
      ;   
    midiC = sett.addNumberbox("midiChannel", (int)gridCols[18]+5, (int)gridRow[12], boxX, boxY)
      .plugTo( this, "midiChannel" )
      .setId(2005)
      .setColorBackground(ControlP5.BLACK)
      .setLabel("Midi Channel")
      .setRange(1, 16)
      ;
    dmx = sett.addNumberbox("addressDMX", (int)gridCols[18]+5, (int)gridRow[14], boxX, boxY)
      .plugTo( this, "addressDMX" )
      .setId(2006)
      .setColorBackground(ControlP5.BLACK)
      .setLabel("DMX address")
      .setRange(0, 127)
      ;
    dMode =  sett.addScrollableList("toggleMode")
      .setPosition( gridCols[18]+5, gridRow[16])
      .setSize(170, 250)
      .plugTo( this, "toggleMode" )
      .onEnter(toFront)
      .onLeave(close)
      .setId(2007)
      .setColorBackground(ControlP5.BLACK)
      .setBarHeight(28)
      .setItemHeight(30)
      .addItems(toggleList)
      .setOpen(false)
      .setType(ControlP5.DROPDOWN)
      .setLabel("Mode")
      ;
    dKeys = sett.addScrollableList("keyBoard")
      .setPosition( gridCols[18]+5, gridRow[17])
      .setSize(170, 250)
      .plugTo( this, "keyBoard" )
      .onEnter(toFront)
      .onLeave(close)
      .setId(2010)
      .setColorBackground(ControlP5.BLACK)
      .setBarHeight(30)
      .setItemHeight(35)
      .addItems(keyboardList)
      .setType(ControlP5.DROPDOWN)
      .setOpen(false)
      .setLabel("Keys");
    dModif = sett.addScrollableList("Modifiers")
      .setPosition( gridCols[18]+5, gridRow[18])
      .setSize(170, 250)
      .plugTo( this, "modifiersBox" )
      .onEnter(toFront)
      .onLeave(close)
      .setId(2009)
      .setColorBackground(ControlP5.BLACK)
      .setBarHeight(28)
      .setItemHeight(30)
      .addItems(modifiersList)
      .setType(ControlP5.DROPDOWN)
      .setOpen(false)
      .setLabel("Modifiers");
    sett.addToggle("togglePage")  
      .plugTo( this, "togglePage" )
      .setId(2008)
      .setMode(ControlP5.SWITCH)
      .setColorBackground(color(255, 100))
      .setSize(boxX-10, boxY-10)
      .setPosition(gridCols[18]+5, gridRow[18])
      .setVisible(false);
    mp = sett.addNumberbox("memoryPosition", (int) gridCols[18]+5, (int)gridRow[1], boxX, boxY)
      .plugTo( this, "memoryPosition" )
      .setId(2000)
      .setRange(0, 127)
      .setColorBackground(ControlP5.BLACK)
      .setLabel("Memory Position")
      .setVisible(false);
    // makeEditable( mp );
    makeEditable( nT );
    makeEditable( min ); 
    makeEditable( max ); 
    makeEditable( midiC ); 
    makeEditable( dmx );
  }
  // THE LISTENER EVENT TO CAPTURE THE TOGGLE EVENT //

  void note(int v) {
    note = v;
    //    println("Value of the Note: "+ v);
  }
  void setExcursionControllMin(int v) {
    setExcursionControllMin = v;
    // println(" Minimum Value: "+ v);
  }
  void setExcursionControllMax(int v) {
    setExcursionControllMax = v;
    //println(" Maximum Value: "+ v);
  }
  void midiChannel(int v) {
    midiChannel = v;
    //println("Value of MIDI Channel: "+v);
  }
  void addressDMX(int v) {
    addressDMX = v;
    //println("Value of DMX Address: "+v);
  }
  void toggleMode(int f) {  
    println("toggle: " + f);
    toggleMode = f;
  }
  public void midiTypeOpt(int a) {
    indexMidiType =  a;
    println("index midi type: " + indexMidiType);
  }
  void keyBoard(int f) {  
    if  ( f > 118) {
      keyBoard = f-94;
      //ddl.addItem((String)keyboardList.get(i), i+3);
    } else
      if ( f >= 24 ) {
        //ddl.addItem((String)keyboardList.get(i), i+1);
        keyBoard = f+8;
      } else {
        keyBoard = f;
      }
    println("keysRaw", f);
    println("keys", keyBoard);
    //println("size", keyboardList.size());
  }
  void modifiersBox(int f) {  
    //println("toggle", f);
    modifiers = f;
    //println(f);
  }
  void togglePage(boolean f) {
    //println("togglePage", f);
    //  togglePage = f;
  }
  void memoryPosition(int v) {
    // memoryPosition = v;
    //   println("Value of Memory Position: "+v);
  }
  void displaySettingsUI() {

    fill(255);
    text(label +" Settings", gridCols[19], gridRow[1]); // box settings  label
  }
  //TO EDIT THE NUMBER OF SETTINGS IN NUMBERBOX
  void makeEditable( Numberbox n ) {
    // allows the user to click a numberbox and type in a number which is confirmed with RETURN
    final NumberboxInput nin = new NumberboxInput( n ); // custom input handler for the numberbox
    // control the active-status of the input handler when releasing the mouse button inside 
    // the numberbox. deactivate input handler when mouse leaves.
    n.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        nin.setActive( true );
      }
    }
    ).onLeave(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        nin.setActive( false ); 
        nin.submit();
      }
    }
    );
  }
  void sendMidiMessageON() {
    if ( noteCC == true) {
      myBus.sendMessage(0xB0, midiChannel-1, note, 127);
    } else if ( noteCC == false) {
      myBus.sendMessage(0x90, midiChannel-1, note, 127);
    }
  }
  void sendMidiMessageOFF() {
    if ( noteCC == true) {
      myBus.sendMessage(0xB0, midiChannel-1, note, 0);
    } else if ( noteCC == false) {
      myBus.sendMessage(0x90, midiChannel-1, note, 0);
    }
  }
  void loadTableRow(TableRow t) {
    label = t.getString("Name");
    memoryPosition = t.getInt("MemoryPosition");
    indexMidiType = t.getInt("midiType");
    note= t.getInt("Note");
    setExcursionControllMax= t.getInt("MaximumValue");
    setExcursionControllMin =t.getInt("MinimumValue");
    midiChannel = t.getInt("MidiChannel");
    String toggleM = t.getString("Toggle");
    for (int i=0; i< toggleList.length; i++) {
      if (toggleList[i].equals( toggleM)) {
        dMode.setValue(i);
        break;
      }
    }

    keyBoard = t.getInt("Keys");
    modifiers = t.getInt("Modifiers");
    dMode.setValue(toggleMode);
    dKeys.setValue(keyBoard);

    addressDMX = t.getInt("DMXAddress");
    togglePage = boolean(t.getInt("Page"));
    mp.setValue(memoryPosition);
    String midiTemp = t.getString("midiType");
    for (int i=0; i< typeMidiList.length; i++) {
      if (typeMidiList[i].equals( midiTemp)) {
        midiTypeOpt.setValue(i);
        break;
      }
    }
    nT.setValue(note);
    min.setValue(setExcursionControllMin);
    max.setValue(setExcursionControllMax);
    midiC.setValue(midiChannel);
    dmx.setValue(addressDMX);
  }
}
CallbackListener toFront = new CallbackListener() {
  public void controlEvent(CallbackEvent theEvent) {
    theEvent.getController().bringToFront();
    ((ScrollableList)theEvent.getController()).open();
  }
};
CallbackListener close = new CallbackListener() {
  public void controlEvent(CallbackEvent theEvent) {
    ((ScrollableList)theEvent.getController()).close();
  }
};