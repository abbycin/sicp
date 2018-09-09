/*********************************************************
          File Name: pascal.cc
          Author: Abby Cin
          Mail: abbytsing@gmail.com
          Created Time: Sat 21 Apr 2018 02:55:57 PM CST
**********************************************************/

#include <iostream>

void pascal(int& res, int r, int c)
{
  if(c == 0 || c > r)
  {
    res += 0;
  }
  else if(c == r)
  {
    res += 1;
  }
  else
  {
    pascal(res, r - 1, c - 1);
    pascal(res, r - 1, c);
  }
}

int main(int argc, char* argv[])
{
  if(argc != 2)
  {
    fprintf(stderr, "%s number\n", argv[0]);
    return 1;
  }
  int n = atoi(argv[1]);
  int res = 0;
  for(int r = 1; r <= n; ++r)
  {
    for(int i = r; i < n; ++i)
    {
      putchar(' ');
    }
    for(int c = 1; c <= r; ++c)
    {
      res = 0;
      pascal(res, r, c);
      printf("%d ", res);
    }
    putchar('\n');
  }
}
