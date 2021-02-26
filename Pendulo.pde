float largoP1 = 127;// rango de 0 a 255
float largoP2 = 127;//rango de 0 a 255
float masa1 = random(15);//modificable 
float masa2 = random(15);//modificable 
float a1 = random(TWO_PI); 
float a2 = random(TWO_PI); 
float va1 = 0; 
float va2 = 0; 
float g = 0.5;//modificable
float cx, cy;

int n = 3600000;// numero de vueltas
PVector pos[] = new PVector[n];// posicines a gurdar
color colores[] = new color[n];// colores a guardar
color c;


void pendulo(){
  cx = 0;
  cy = 0;
  for (int i = 0; i< n; i++){
    float n1 = -g * (2 * masa1 + masa2) * sin(a1);
    float n2 = -masa2 * g * sin(a1-2*a2);
    float n3 = -2*sin(a1-a2)*masa2;
    float n4 = va2*va2*largoP2+va1*va1*largoP1*cos(a1-a2);
    float n5 = largoP1 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na1 = (n1 + n2 + n3*n4) / n5;
    n1 = 2 * sin(a1-a2);
    n2 = (va1*va1*largoP1*(masa1+masa2));
    n3 = g * (masa1 + masa2) * cos(a1);
    n4 = va2*va2*largoP2*masa2*cos(a1-a2);
    n5 = largoP2 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na2 = (n1*(n2+n3+n4)) / n5;
    float x1 = cx+largoP1 * sin(a1);
    float y1 = cy+largoP1 * cos(a1);
    float x2 = x1 + largoP2 * sin(a2);
    float y2 = y1 + largoP2 * cos(a2);
    
    pos[i] = new PVector(x2,y2);//se guarda la posicion en el array 
    c = color(x2,y2/5,y2/5,y2);//se optiene el color
    colores[i] = c;//se guarda el color en el arra
    
    va1 += na1;
    va2 += na2;
    a1 += va1;
    a2 += va2;
  }
  
  loadPixels();
  for(int i=0;i<pixels.length;i++){
      pixels[i] = colores[i];// se da el color a cada pixel
   }
  updatePixels();
}
