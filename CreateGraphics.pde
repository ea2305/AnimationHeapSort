
public class CreateGraphics{
  
  float sizeX;
  float sizeY;
  int elements;
  
  public CreateGraphics(){
    this.sizeX = 0;
    this.sizeY = 0;
  }
  
  public CreateGraphics(float sizeX,float sizeY,int elements){
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.elements = elements;
  }
  
  void graphicNow(int [] A,int mX, int mY){
    noStroke();
    
    int sizeArray = A.length;       
    float size = (sizeX/sizeArray);
    float rs = 1;
    if(sizeArray > 100)
      rs = .75;
    else
      if(sizeArray > 200)
        rs = .5;
      else
        if(sizeArray > 300)
          rs = .25;
    
/*    for(int i = 0 ; i < sizeArray; i++)
      print("[" + A[i] + "]");
    println();
*/    
    fill(#092724);
    rect(0,0,sizeX,sizeY);//Fondo
    
    
    
    fill(#F7F7D4,100);
    for(int i = 0 ; i < sizeArray; i++){

      if(mX == i )
        fill(#A9F743);
        
      if(mY == i)
          fill(#D2F7A2);
          
      rect(i * size, sizeY - 10, size - rs, (((this.sizeY - 10) * A[i])/this.elements) * -1,10);
      fill(#F7F7D4,100);

    }
  }
}