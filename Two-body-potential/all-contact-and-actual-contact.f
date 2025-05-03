	parameter (n=400, m=500, mp=2000, rcut=5)
	dimension x(m,mp),y(m,mp),z(m,mp)
	character aa(mp,mp)*1,aa1(n)*1,aa2(n)*1,dcl(m)*8
	integer pp,rescount
	real sum1, sum2, sum3, sum4,r(n,mp,mp)

	open(1,file="pdb-id-final-pot-gen-500-pro")
	open(2,file="aminoacids-pair")	
	open(3,file="total-actual-contacts")
	open(4,file="all-contact-file")

	do i=1,m
	read(1,"(a8)") dcl(i)
	enddo

	do j=1,n
	read(2,"(a1,a1)") aa1(j),aa2(j)
	enddo
	
	sum1=0.0
	do i=1,n
	do j=1,m
	open(5,file="coord-CA-500-pro/"//dcl(j)) 

	do k=1,mp
	rescount=k
	read(5,300,err=500,end=1000) aa(j,k),x(j,k),y(j,k),z(j,k)
300 	format (a1,3x,F10.3,3x,F10.3,3x,F10.3)
500	enddo

1000	pp=rescount
	do k=1,pp
	do l=k+2,pp

	if(aa1(i).eq.aa(j,k) .and. aa2(i).eq.aa(j,l)) then
	
	r(i,k,l)=sqrt((x(j,k)-x(j,l))**2+(y(j,k)-y(j,l))**2+
     $  (z(j,k)-z(j,l))**2)

	if(r(i,k,l) .lt. rcut) then
	
	sum1=sum1+1
	write(4,"(a1,a1)") aa(j,k),aa(j,l)
	endif
	endif
	enddo
	enddo
	enddo
	enddo
	write(3,*)sum1

	stop
	end
