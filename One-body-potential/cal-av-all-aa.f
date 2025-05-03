	parameter(nm=10,nbin=200,na=20)
	
	character nndistfile(nm)*20,nndistfilesum(nm)*21
	character nndistfilesav(nm)*20
	
	real sum1(nbin),nn(na,nbin)
	
	open(1,file="nndistfile")
	open(3,file="nndistfile-sum")
	open(9,file="nndistfile-av")
	
	do i=1,nm
	
	read(1,"(a20)") nndistfile(i)
	read(3,"(a21)") nndistfilesum(i)
	read(9,"(a20)") nndistfilesav(i)
	
c	write(*,"(a20)") nndistfile(i)
c	write(*,"(a21)") nndistfilesum(i)
	
	enddo
		
	do i=1,nm
		
	open(2,file=nndistfile(i))
	open(7,file=nndistfilesum(i))
	open(8,file=nndistfilesav(i))
	
	do j=1,na
	do k=1,nbin

	read(2,"(F12.8)") nn(j,k)
c	write(*,"(F12.8)") nn(j,k)

	enddo
	enddo
	
	do k=1,nbin
	sum1(k)=0.0
	
	do j=1,na
	
	sum1(k)=sum1(k)+nn(j,k)
	
	enddo
	
	write(7,"(F12.8)") sum1(k)
	write(8,"(F12.8)") sum1(k)/na
	
	enddo
	enddo
c	write(*,"(F12.8)") nn(1,1),nn(1,25),nn(2,20)
	
	stop
	end
