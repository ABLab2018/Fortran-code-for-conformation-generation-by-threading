	parameter(np=19537,n=50)
	real x(np,n),y(np,n),z(np,n),r(np,n,n)	
	integer i,j,k
	
	open(1,file="CA-coord-gen-conf-after-threading")
	open(2,file="contact-profile-all-lt-5")
	open(3,file="contact-profile-all-5-6")
	open(7,file="contact-profile-all-6-7")
	open(8,file="contact-profile-all-7-8")
	open(9,file="contact-profile-all-8-9")
	open(10,file="contact-profile-all-9-10")
	open(11,file="contact-profile-all-10-11")
	open(12,file="contact-profile-all-11-12")
	open(13,file="contact-profile-all-12-13")
	open(14,file="contact-profile-all-13-14")
	open(15,file="contact-profile-all-14-15")

	do i=1,np
	do j=1,n
	read(1,"(f7.3,5x,f7.3,5x,f7.3)")x(i,j),y(i,j),z(i,j)
	write(*,*) x(i,j),y(i,j),z(i,j)
	enddo
	enddo

	do i=1,np
	do j=1,n
	do k=1,n

	if(abs(j-k).gt.2)then
	
	r(i,j,k)=sqrt((x(i,j)-x(i,k))**2+(y(i,j)-y(i,k))**2+
     $  (z(i,j)-z(i,k))**2)
     
	if(r(i,j,k) .lt. 5)then
	write (2,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 5 .and. r(i,j,k) .lt. 6)then
	write (3,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 6 .and. r(i,j,k) .lt. 7)then
	write (7,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 7 .and. r(i,j,k) .lt. 8)then
	write (8,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 8 .and. r(i,j,k) .lt. 9)then
	write (9,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 9 .and. r(i,j,k) .lt. 10)then
	write (10,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 10 .and. r(i,j,k) .lt. 11)then
	write (11,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 11 .and. r(i,j,k) .lt. 12)then
	write (12,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 12 .and. r(i,j,k) .lt. 13)then
	write (13,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 13 .and. r(i,j,k) .lt. 14)then
	write (14,*) i,j,k
	endif
	
	if(r(i,j,k) .ge. 14 .and. r(i,j,k) .lt. 15)then
	write (15,*) i,j,k
	endif
	
	endif
	
	enddo
	enddo
	enddo

	stop
	end
