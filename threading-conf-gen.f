c	non-native conformation generation by threading for target 1LZ1
	
	parameter(n=556,m=1,nlen=2000,ntar=74)
	
	character pdb(n)*8
	real x(nlen,m),y(nlen,m),z(nlen,m)
	integer count,count1,count2,pp,count3,pp1
	
	open(1,file="pdb-id-threading")
	open(2,file="CA-coord-gen-conf-after-threading")
	
	do i=1,n
	read(1,"(a8)") pdb(i)
c	write(*,*) pdb(i)
	enddo
	
	do i=1,n
	open(3,file="coord-CA-556-pro/"//pdb(i))
	
	do j=1,nlen
	do k=1,m
	count=j
	count1=k
	read(3,"(29x,f7.3,6x,f7.3,6x,f7.3)",err=20,end=50)x(j,k),
     $   y(j,k),z(j,k)
c	write(*,*) x(j,k),y(j,k),z(j,k)
	enddo
20	enddo
	
50	pp=count*count1-1
	pp1=(pp-50)/5
	
	open(20,file="no-conf-gen-threading")
	write(20,*) pdb(i)
c********************************************************************************

	count2=0
	count3=0	
	do j=1,ntar
	
	count2=count2+1
	
c	write(*,*) count2
	do k=1,m
	
	write(2,"(f7.3,5x,f7.3,5x,f7.3)")x(j,k),y(j,k),z(j,k)
	
	enddo
	
c	write(*,*) count2
	
	if (count2 .ge. ntar) then
		do kk=1,pp1
		count3=count3+1
c		write(*,*) count3,kk
		
		do jj=1,ntar
		do k=1,m
	
		write(2,"(f7.3,5x,f7.3,5x,f7.3)")x((jj+5*count3),k),
     $  	y((jj+5*count3),k),z((jj+5*count3),k)
     		enddo
     		enddo
     		enddo
c     	write(*,*) count3,kk
     	endif

	enddo
	
	enddo
	
	stop
	end
