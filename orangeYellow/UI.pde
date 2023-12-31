 void UI(){
  cp = new ControlP5(this, createFont("得意黑", 24));
  cp.addSlider("spring", -3, 3, 0.1, 50, 90, 100, 30).setLabel("spring");
  cp.addSlider("gravity ", -10, 10, 0, 50, 170, 100, 30).setLabel("gravity");
   cp.addSlider("friction", -1, 0, -0.5, 50, 210, 100, 30).setLabel("friction");
 }
