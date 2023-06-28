#include <stdio.h>
#include <time.h>
#include <stdlib.h>

char buff[65536];

#define rand_number 48 +rand()%44

int main(){
  FILE *file_r;
  file_r = fopen("./string.txt","r+");
  fgets(buff, 65536, file_r);
  printf("%s",buff);
  FILE *file_w;
  file_w = fopen("./string.txt","w+");
  srand(time(NULL));
  for(int i=0;i<65536;i++){
    char num =(char) rand_number;
    if(num == 48){
      fprintf(file_w, "\n");
    }
    buff[i] = num;
    fprintf(file_w,"%c",num);
  }
  fprintf(file_w, "%c",buff);
  return 0;
}
