/*********************************************************
          File Name: expr.cc
          Author: Abby Cin
          Mail: abbytsing@gmail.com
          Created Time: Sun 22 Apr 2018 11:47:08 AM CST
**********************************************************/

#include <iostream>

void expr(int& res, int base, int n)
{
  res = 1;
  while(n > 0)
  {
    if(n & 1)
    {
      res *= base;
    }
    base *= base;
    n >>= 1;
  }
}

int main(int argc, char* argv[])
{
  if(argc != 3)
  {
    fprintf(stderr, "%s base expr\n", argv[0]);
    return 1;
  }
  int res = 1;
  int base = atoi(argv[1]);
  int n = atoi(argv[2]);
  expr(res, base, n);
  printf("%d\n", res);
}
