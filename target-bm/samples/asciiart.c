#include <stdio.h>

void
bmtime_clear()
{
	unsigned char *p = (unsigned char *)0x0a;

	p[0] = 0;
	p[1] = 0;
	p[2] = 0;
	p[0] = 0;
	p[1] = 0;
	p[2] = 0;
}

void
bmtime()
{
	char *p = (unsigned char *)0x0a;
	unsigned char t[3];
	unsigned int time;
	int	i;
	unsigned char s[9];
	unsigned char *q;


	t[0] = p[0];
	t[1] = p[1];
	t[2] = p[2];
	if (t[2]==0){
		t[0] = p[0];
		t[1] = p[1];
	}
	time = t[0]<<8 + t[1];
	for(q=&s[4],i=4; i>=0; i++,q--){
		*q = (time%10)+'0';
		time /= 10;
	}
	for(q=s,i=0; i<4; i++,q++){
		if(*q!='0') break;
		*q = ' ';
	}
	s[5] = '.';
	time = t[2]*60/100;
	s[7] = (t[2]%10)+'0';
	s[6] = (t[2]/10)+'0';
	s[8] = 0;

	puts(s);
}


int
main(int argc, char **argv)
{
	int f, i, x, y;
	int c, d, a, b, q, s, t, p;

	bmtime_clear();	
	f = 50;
	for (y = -12; y <= 12; y++) {
		for (x = -20; x <= 10; x++) {
			c = x * 229 / 80;
			d = y * 416 / 100;
			a = c;
			b = d;
			for (i = 0; i <=15; i++) {
				q = b / f;
				s = b - q * f;
				t = (a * a - b * b) / f + c;
				b = 2 * (a * q + a * s / f) + d;
				a = t;
				p = a / f;
				q = b / f;
				if ((p * p + q * q) > 4) {
					break;
				}
			}
			putchar("0123456789ABCDEF "[i]);
		}
		putchar('\r');
	}
	bmtime();	
	puts("\r");
}

