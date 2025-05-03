	parameter (n=20, m=30098,p=60196)
	
	character aa(n)*1,aa1(m)*1,aa2(m)*2
	real sum1(n),sum2(n)

	open(1,file="aminoacids")	
	open(2,file="all-contact-file")
	open(3,file="individual-occur-prob-file")

	do i=1,n
	read(1,"(a1)") aa(i)
	enddo

	do i=1,m
	read(2,"(a1,a1)") aa1(i),aa2(i)
	enddo
	
	
	do i=1,n
	sum1(i)=0

	do j=1,m

	if (aa(i) .eq. aa1(j) .or. aa(i) .eq. aa2(j)) then
	sum1(i)=sum1(i)+1
	endif

	enddo
c	sum2(i)= sum1(i)/m
	sum2(i)= sum1(i)/p
	write(*,*) m*2
	write (3,"(a1,5x,f8.1,5x,f7.3)") aa(i), sum1(i), sum2(i)
	
	enddo
	
	stop
	end
