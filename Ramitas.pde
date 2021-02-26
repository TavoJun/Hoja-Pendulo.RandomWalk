class Particula{
  PVector pos;
  PVector pospre;
  PVector vel;
  PVector aceleracion;
  PVector pos2;
  float salto;
  float tam;
  ArrayList <PVector> posiciones;
  int nc=2500;
  PVector posixy[] = new PVector[nc]; 
  color coloorr = color(random(200),random(50,150),random(150,255));
  
  
    Particula(PVector pos_, PVector pos2_,float tam_){// constructor1
    pos = pos_;
    pospre = pos.copy(); 
    vel = new PVector(0,0);
    salto = 0.5;
    pos2 = pos2_;
    tam = tam_;
    posiciones = new ArrayList <PVector>();
    
    for(int i = 0; i < nc; i++){
    float num = floor(random(2));
    
    posixy[i] = new PVector(pos.x, pos.y);
    switch(int(num)) {/////////////////////////
    case 0: 
            posiciones.add(pos.copy());
            PVector step = PVector.random2D();//posicion aleatoria
            step.mult(salto);
            pos.add(step);
    break;
    case 1: ////////////////////////////////
            posiciones.add(pos.copy());
            PVector dir = PVector.sub(pos2,pos);
            dir.normalize();
            dir.mult(salto);
            aceleracion=dir;
            vel.add(aceleracion);
            vel.limit(salto);
            pos.add(vel);
            
    break;
    }
            
    tam=tam-0.01;
    println(tam);
    stroke(coloorr);
    strokeWeight(tam);
    line(pos.x,pos.y,pospre.x,pospre.y);
    pospre.set(pos);
    if(tam<1){
      tam=1;
    }else{
      tam=tam-0.001;
      }
     } 
   }
   
   ///////////////////////////////////////////////////////////////////////////////////////
   Particula(PVector pos_){//constructor2
    pos = pos_;
    pospre = pos.copy(); 
    vel = new PVector(0,0);
    salto = 20;

    
    for(int i = 0; i < 25; i++){
    float num = floor(random(2));
    
    posixy[i] = new PVector(pos.x, pos.y);
    switch(int(num)) {
    case 0: 
            PVector step = PVector.random2D();
            step.mult(salto);
            pos.add(step);
    break;
    case 1: 
            PVector dir = PVector.random2D();
            dir.normalize();
            dir.mult(salto);
            aceleracion=dir;
            vel.add(aceleracion);
            vel.limit(salto);
            pos.add(vel);
            
    break;
    
    }
     //println(0.5);
     stroke(coloorr,180);
     strokeWeight(0.5);
     line(pos.x,pos.y,pospre.x,pospre.y);
     pospre.set(pos);
     tam=0.5;
    } 
   }
   
   ///////////////////////////////////////////////////////////////////////////////////////
    PVector[] getPosiciones(){
    PVector posi[] = new PVector[posiciones.size()];
    for(int i=0; i<posiciones.size(); i++){
      posi[i] = posiciones.get(i);
    }
    return posi;
  }
}
