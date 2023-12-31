float SDofSphere(PVector p,PVector pos,float rad){
  PVector diff = pos.sub(p);
  float SD = diff.mag() - rad;
  return SD;
}

float SDofBoxInside(PVector p){
  return min(min(p.x+1,width-p.x+1),min(p.y+1,height-p.y+1));
}

float softMin(float a, float b, float v) {
    if(a - b >= -v && a - b <= v) {      
        float k = (a - b + v) / (2 * v);
        return (1 - k) * a + k * b - v * k + v * k * k;
    } else if (a < b) {
        return a;
    } else {
        return b;
    }
}
