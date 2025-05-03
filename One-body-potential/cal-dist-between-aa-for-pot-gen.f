	parameter(np=500, nl=50000,nf=10)
	
	character pdb(np)*8,filename(nf)*7
	character aaname(nl)*6,aa(nl)*3,atom(nl)*7
	real x(nl),y(nl),z(nl),r(nl,nl),nneighbor,distance(nl)
	integer rescount,pp,count1,count2,count3
	integer site(nl),location,amino(nl),sum1,count(nl)
	
	open(1,file="pdb-id-final-pot-gen")
	open(2,file="file-name-ALA")
	
	do i=1,np
	read(1,"(a8)") pdb(i)
c	write(*,*) pdb(i)
	enddo
	
	do i=1,nf
	read(2,"(a7)") filename(i)
c	write(*,*) filename(i)
	enddo

	do i=1,np
	open(3,file="coord-CA-500-pro/"//pdb(i))
	
	do j=1,nl
	rescount=j
	read(3,100,err=10,end=20) aaname(j),aa(j),atom(j),x(j),y(j),z(j)
100	format(a6,5x,a3,a9,3x,F10.3,3x,F10.3,3x,F10.3)

c	write(*,200) aaname(j),aa(j),atom(j),x(j),y(j),z(j)
c200	format(a6,5x,a3,a9,3x,F10.3,3x,F10.3,3x,F10.3)

10	enddo
	
20	pp=rescount-1
c	write(*,*) pp
c	write(11,*) pdb(i)
c	write(12,*) pdb(i)
	count1=0
	
	do j=1,pp	

c	write(*,*) aa(11)
	if (aa(j) .eq. "ALA") then
	count1=count1+1

	amino(j)=j
c	write(*,*) j
	
	do k=1,pp
	
	site(k)=k
	if(abs(j-k).gt. 2)then
	
	r(j,k)=sqrt((x(j)-x(k))**2+(y(j)-y(k))**2+
     $  (z(j)-z(k))**2)
C	write(*,*) r(j,k)
	endif
	enddo		
	
	do kk=1,pp-1
	do k1=1,pp-kk
		
	if (r(j,k1) .gt. r(j,k1+1)) then

	nneighbor=r(j,k1)
	r(j,k1)=r(j,k1+1)
	r(j,k1+1)=nneighbor
	
	location=site(k1)
	site(k1)=site(k1+1)
	site(k1+1)=location
	
c	write(*,*) nneighbor
	endif
	enddo
	enddo
	
	open(11,file="dist-from-1st-ALA-sort")
	open(12,file="nneighbor-position-details-ALA")
	open(13,file="dist-check")
	
	do k=1,pp
	distance(k)=r(j,k)
	write(13,*) distance(k)
c	write(*,*) distance(k),k
	enddo

	count3=0
	do k=1,20
	
	if (distance(k) .ne. 0) then
	count3=count3+1
c	write(*,*) k
	if (count3 .le. 10) then
	write(11,*) distance(k),j,site(k)
	write(12,*) distance(k),amino(j),site(k),site(k)-amino(j)	
	endif
	
	if (count3 .gt. 10) then 
	go to 180
	endif
	
	endif
180	enddo
	
	count2=0
	
	do kk=1,20
	if (distance(kk) .ne. 0) then
	count2=count2+1
c	write(*,*) count2
	
	if (count2 .le. 10) then
	open(14,file="nn-calpha-dist-cal/"//filename(count2),
     $   position="append")
	
	write(14,*) distance(kk)
	endif
	
	if (count2 .gt. 10) then 
	go to 190
	endif
	
	endif
190	enddo
	
	else 
	go to 70
	
	endif
70	enddo

	open(16,file="protein-no-of-ALA")
	write(16,*) pdb(i),count1,count1*5
	open(17,file="protein-no-of-ALA-count")
	write(17,*) count1
	write(*,*) count1

	enddo
	
	stop
	end
