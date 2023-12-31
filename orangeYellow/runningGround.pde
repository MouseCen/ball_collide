
class runningGround{
  Ball[] balls;
  float[][] SDmap;
  float [][] SDmapTemp;
  runningGround (Ball[] _balls){
    balls =_balls;
    SDmap = new float[width][height];
    SDmapTemp = new float[width][height];
    for(float[] row : SDmap){
      for(float SD : row){
        SD = 1000000000;
      }
    }
    SDmapTemp = SDmap; 
  }
  
  void initialize(){

  }

  void update(){
    //计算出来SD地图
    
    for(int i = 0;i<width;i++){
      for(int j =0;j<height;j++){
        float[] SD = new float[balls.length];
        for(int k = 0;k<balls.length;k++){
          float x = balls[k].x;
          float y = balls[k].y;
          float rad = balls[k].diameter/3;
          SD[k] = SDofSphere(new PVector(i,j),new PVector(x,y),rad);
        }
        SDmap[i][j] = softMin(SD[0],SD[1],10);
        for(int l=2;l<balls.length;l++){
          SDmap[i][j] = softMin(SDmap[i][j], SD[l], 10);
          SDmap[i][j] = softMin(SDmap[i][j],SDofBoxInside(new PVector(i,j)),10);
        }
        //SDmap[i][j] = softMin(SD[0],SD[1],200);
        //SDmap[i][j] = softMin(SD[2],SDmap[i][j],200);
      }
    }
    //鼠标交互
      //for(int i = 0;i<width;i++){
      //  for(int j =0;j<height;j++){
      //    float d = SDofSphere(new PVector(i,j),new PVector(mouseX,mouseY),10);
      //    float temp = softMin(SDmap[i][j], d, 20);
      //    SDmap[i][j] = temp;
      //  }
      //}    
    
  }

  void display(){
    //渲染出来地图
    loadPixels();
    for(int i = 0;i<width;i++){
      for(int j = 0;j<width;j++){
        int loc = j*width + i;
        float b = map(SDmap[i][j],0,width/2,0,255);
        pixels[loc] = color(b,b,b);
        //if(SDmap[i][j] >= 100&&SDmap[i][j]<=200){
        //  pixels[loc] = color(255,255,255);
        //}
      }
    }
    
    updatePixels();
  }
  
  void display3D(){
    for(int i = 0;i<width;i++){
      for(int j = 0;j<width;j++){
        int loc = j*width + i;
        float b = map(SDmap[i][j],0,width*1.5,0,255);
        pushMatrix();
        translate(i,j,b);
        box(1);
        popMatrix();
        //if(SDmap[i][j] >= 100&&SDmap[i][j]<=200){
        //  pixels[loc] = color(255,255,255);
        //}
      }
    }
  }
}
