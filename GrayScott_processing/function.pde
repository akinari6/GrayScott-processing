void loadingFlip(float[][] matrix,PImage img){
  img.loadPixels();
  for(int y=0;y<img.height;y++){
    for(int x=0;x<img.width;x++){
      int loc=x+y*img.width;
      
      float tmp=map(matrix[y][x],0,1,255,0);
      img.pixels[loc]=color(tmp);
    }
  }
  img.updatePixels();
}

void loading(float[][] matrix,PImage img){
  img.loadPixels();
  for(int y=0;y<img.height;y++){
    for(int x=0;x<img.width;x++){
      int loc=x+y*img.width;
      
      float tmp=map(matrix[y][x],0,1,0,255);
      img.pixels[loc]=color(tmp);
    }
  }
  img.updatePixels();
}

void loadingThreshold(float[][] matrix,PImage img){
  img.loadPixels();
  
  for(int y=0;y<img.height;y++){
    for(int x=0;x<img.width;x++){
      int loc=x+y*img.width;
      
      if(matrix[y][x]>0.5){//濃度が１を超えたら黒
        img.pixels[loc]=color(0);
      }else{//濃度が０なら白
        img.pixels[loc]=color(255);
      }
    }
  }
  
  img.updatePixels();
}

void loadingP(float[][] matrix){
  loadPixels();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int loc=x+y*width;
      
      float tmp=map(matrix[y][x],0,1,0,255);
      pixels[loc]=color(tmp);
    }
  }
  updatePixels();
}

void roll(float[][] matrix,int cols,int rows,int axis,int dir,float[][] tmp){  
  for(int y=0;y<cols;y++){
    for(int x=0;x<rows;x++){
      if(axis==1){
        int tx=x-dir;
        if(tx<0){
          tx=rows-1;
        }else if(tx>rows-1){
          tx=0;
        }
        tmp[y][tx]=matrix[y][x];
      }else if(axis==0){
        int ty=y-dir;
        if(ty<0){
          ty=cols-1;
        }else if(ty>cols-1){
          ty=0;
        }
        tmp[ty][x]=matrix[y][x];
      }
    }
  } 
}
