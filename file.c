#include<stdio.h>
int main()
{
	char b[100];
	char a[]="hello";
	FILE *fp;
	fp=fopen("learn.txt","r");
	while(feof(fp))
	fscanf(fp, "%s", a);
	 printf("%s",b);
	return 0;
}
