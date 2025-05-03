	parameter (p=20,n=400, m=30098)
c	dimension aa(n),aa1(m)
	character aa1(n)*1,aa2(n)*1,aa3(m)*1,aa4(m)*1
	real sum1(n),sum2(n)

	open(1,file="aminoacids-pair")
	open(2,file="all-contact-file")
c	open(3,file="aminoacids")
	open(4,file="actual-pair-probability-file-new")

	do i=1,n
	read(1,100) aa1(i),aa2(i)
100	format(a1,a1)
c	write(*,"(a2)") aa(i)
	enddo


	do i=1,m
	read(2,300) aa3(i),aa4(i)
300	format(a1,a1)
c	write(*,*) aa1(i)
	enddo


	do i=1,n
	sum1(i)=0
	sum2(i)=0	
	
	do j=1,m
	if (aa1(i) .eq. aa3(j) .and. aa2(i) .eq. aa4(j) .or.
     $   aa1(i) .eq. aa4(j) .and. aa2(i) .eq. aa3(j)) then

	sum1(i)=sum1(i)+1
	endif
	enddo

	sum2(i)=sum1(i)/m

	write(4,"(a1,a1,5x,f7.1,5x,f8.6)") aa1(i),aa2(i),sum1(i),sum2(i)
	enddo
	
	stop
	end
