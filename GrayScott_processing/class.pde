class GrayScott {
  int cols=480;
  int rows=640;
  float[][] u=new float[cols][rows];
  float[][] v=new float[cols][rows];

  float Du=0.00002;
  float Dv=0.00001;
  float f=0.04;
  float k=0.06;
  float dx=0.01;
  float dt=1.05;
  
  float w=0.01;
  
  int squareSize=20;

  float[][] uabove=new float[cols][rows];
  float[][] ubelow=new float[cols][rows];
  float[][] uleft=new float[cols][rows];
  float[][] uright=new float[cols][rows];

  float[][] vabove=new float[cols][rows];
  float[][] vbelow=new float[cols][rows];
  float[][] vleft=new float[cols][rows];
  float[][] vright=new float[cols][rows];

  GrayScott() {
  };

  void init() {
    for (int y=0; y<cols; y++) {
      for (int x=0; x<rows; x++) {
        
        u[y][x]=1;
        v[y][x]=0;
        
        

        

        if (y>int(cols/2)-squareSize&&y<int(cols/2)+squareSize&&int(rows/2)-squareSize<x&&x<int(rows/2)+squareSize) {
          u[y][x]=0.5;//random(0,0.5);
          v[y][x]=0.25;//random(0,0.25);
        }
        
        if(y>int(cols/4)-squareSize&&y<int(cols/4)+squareSize&&int(rows/4)-squareSize<x&&x<int(rows/4)+squareSize){
          u[y][x]=0.5;//random(0,0.5);
          v[y][x]=0.25;//random(0,0.25);
        }
        
        if(y>int(cols*3/4)-squareSize&&y<int(cols*3/4)+squareSize&&int(rows*3/4)-squareSize<x&&x<int(rows*3/4)+squareSize){
          u[y][x]=0.5;//random(0,0.5);
          v[y][x]=0.25;//random(0,0.25);
        }
        
        if(y>int(cols*3/4)-squareSize&&y<int(cols*3/4)+squareSize&&int(rows/4)-squareSize<x&&x<int(rows/4)+squareSize){
          u[y][x]=0.5;//random(0,0.5);
          v[y][x]=0.25;//random(0,0.25);
        }
        
        if(y>int(cols/4)-squareSize&&y<int(cols/4)+squareSize&&int(rows*3/4)-squareSize<x&&x<int(rows*3/4)+squareSize){
          u[y][x]=0.5;//random(0,0.5);
          v[y][x]=0.25;//random(0,0.25);
        }
        
        
        //u[y][x]=random(0,1);
        //v[y][x]=random(0,1);
        
        
        u[y][x]+=random(0, 0.1);
        v[y][x]+=random(0, 0.1);
        
      }
    }
  }

  void update() {
    roll(u, cols, rows, 0, -1, uabove);
    roll(u, cols, rows, 0, 1, ubelow);
    roll(u, cols, rows, 1, -1, uleft);
    roll(u, cols, rows, 1, 1, uright);

    roll(v, cols, rows, 0, -1, vabove);
    roll(v, cols, rows, 0, 1, vbelow);
    roll(v, cols, rows, 1, -1, vleft);
    roll(v, cols, rows, 1, 1, vright);

    for (int y=0; y<cols; y++) {
      for (int x=0; x<rows; x++) {
        float dudt=(-u[y][x]*4+uabove[y][x]+ubelow[y][x]+uright[y][x]+uleft[y][x])*Du/(dx*dx)-u[y][x]*v[y][x]*v[y][x]+f*(1.0-u[y][x]);
        float dvdt=(-v[y][x]*4+vabove[y][x]+vbelow[y][x]+vright[y][x]+vleft[y][x])*Dv/(dx*dx)+u[y][x]*v[y][x]*v[y][x]-(f+k)*v[y][x];
        
        
        u[y][x]+=dt*dudt;//+random(-w,w);
        v[y][x]+=dt*dvdt;//+random(-w,w);
        
        
        u[y][x]=constrain(u[y][x],0,1);
        v[y][x]=constrain(v[y][x],0,1);
        
      }
    }
    
  }
  
  void setParam(float f_,float k_,int s_){
    f=f_;
    k=k_;
    squareSize=s_;
  }
    
    
    
}
    
