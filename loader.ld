ENTRY(_start)
SECTIONS {
	.text 0x0 : {
		 * (.text);
		 }
	.data 0x8000 :	{
		 * (.data); 
		}
	}
