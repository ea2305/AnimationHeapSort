
boolean state = false;
int elements = 500;
int Iteracion = 0;

int [] A = new int[elements];
float sizeX = 1200;
float sizeY = 600;
int N = A.length;
int nodo;
int node;

int i_1 = 0;//Llaves
int i_2 = 0;

CreateGraphics Gp = new CreateGraphics(sizeX,sizeY,elements);

void setup(){
  
  frameRate(20);
  size(1200,600);
  
//Peor de los casos 
/*for(int i = 0; i < elements; i++)
      A[i] = elements - i; 
*/
  //Caso Aleatorio
/* for(int i = 0; i < elements; i++)
      A[i] = (int)random(1,elements);
*/
//Mejor de los casos 
  for(int i = 0; i < elements; i++)
      A[i] = i; 
/**/
}

void draw(){
    if(i_1 == 0){i_1 = 1; nodo = N/2;} //<>//
    if(i_1 == 1 && nodo >= 0){//condicion de entrada a FOR adaptado
    
         hacerMonticulo(A, nodo, N-1);     
         Gp.graphicNow(A,nodo,(nodo * 2));
      nodo--;
      
    }else{
      if(i_2 == 0){i_2 = 1;node = N - 1;}
      if(i_2 == 1 && node >= 0){
        
        int tmp = A[0];
        A[0]    = A[node];
        A[node] = tmp;
        
        Gp.graphicNow(A,node - 1,0);
        hacerMonticulo(A, 0, node-1);
        
        node--;
      }
    }
    scoreRange();
     //<>//
 
}


public void scoreRange(){
    
      fill(#EBFAFA,40);
      rect(20,10,150,50,10);

    if(Iteracion > 4500)
      fill(#F27A7A);
    else{
      if(Iteracion >1000)
        fill(#F5B2B2);
      else{
        if(Iteracion > 500)
          fill(#B2E3F5);
        else{
          if(Iteracion > 0)
          fill(#41F0EE);
        }
      }
    }
    textSize(25);  
    text(Iteracion,30,40);
}


// Ordenacion por monticulos - HeapSort
public void ordenacionMonticulos(int[] A) {
    final int N = A.length;
    
    for(int nodo = N/2; nodo>=0; nodo--) 
        hacerMonticulo(A, nodo, N-1);
        
    for(int nodo = N-1; nodo>=0; nodo--) {    
        int tmp = A[0];
        A[0]    = A[nodo];
        A[nodo] = tmp;
        hacerMonticulo(A, 0, nodo-1);
    }
}
 
public void hacerMonticulo(int[] A, int nodo, int fin) {
    
    int izq = 2*nodo+1;
    int der = izq+1;
    int may;
    this.Iteracion++;
    if(izq>fin) return;
    
    if(der>fin) may=izq;
    else may= A[izq]>A[der]?izq:der;
    
    if(A[nodo] < A[may]) {
        int tmp = A[nodo];
        A[nodo] = A[may];
        A[may]  = tmp;
        hacerMonticulo(A, may, fin);
    }
    
}

void mousePressed() {  
  
  if(!state){
    
    state = true;  
    noLoop();
    
  }else{
    
    state = false;
    loop();
  }
}