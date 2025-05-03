	parameter (n=400)
	character a1(n)*1,a2(n)*1
	real mulprob(n),actprob(n),pot(n),pott(n)


	open(1,file="multi-indi-prob-and-actual-pair-prob-file-new")
	open(2,file="aminoacids-pair")

	open(4,file="new-potential-file-CA-0-5-modified")

	do i=1,n
	read(1,100) a1(i),a2(i),mulprob(i),actprob(i)
100	format(a1,a1,5x,f8.6,5x,f8.6)
c	write(*,*) aa(i),mulprob(i),actprob(i)
	enddo


	do i=1,n
	pot(i)=0
	pott(i)=0

	if (a1(i) .eq. a2(i)) then
	pot(i)= -LOG(actprob(i)/mulprob(i))*actprob(i)
	
	elseif (a1(i) .ne. a2(i)) then
	pot(i)= -LOG(actprob(i)/(2*mulprob(i)))*actprob(i)
	endif

	write(4,"(a1,a1,5x,f8.6,5x,f8.6,5x,f9.6)") a1(i),a2(i),
     $   mulprob(i),actprob(i),pot(i)
	
	enddo


	stop
	end
