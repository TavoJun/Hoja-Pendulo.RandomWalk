ArrayList <Particula> particulas;
Particula particulauno;
Particula particulados;
PVector central[];
PVector centrals[];

void ramitas(){
  particulas = new ArrayList <Particula>();
  particulauno = new Particula(new PVector(300,600),new PVector(width/2,0),20);//centrol
  central=particulauno.posixy;
  central = particulauno.getPosiciones();
  
  for(int i = 300; i< 2500; i+=300){
    particulas.add(new Particula(particulauno.posixy[i],new PVector(width,height-i/2),particulauno.tam/2));//
    particulas.add(new Particula(central[i],new PVector(0,height-i/2),particulauno.tam/2));//
     for(int j = 10; j< 2500; j+=60){
      particulas.add(new Particula(particulauno.posixy[j]));
      }
  }
}
